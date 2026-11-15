//+------------------------------------------------------------------+
//|                                            LotSizeCalculator.mq4 |
//|        Free risk-based lot size calculator for MetaTrader 4      |
//|                         Smart Algotrade - https://smartalgotrade.com |
//+------------------------------------------------------------------+
#property copyright "Smart Algotrade"
#property link      "https://smartalgotrade.com"
#property version   "1.00"
#property description "Calculates the lot size for a trade based on the percent of balance you want to risk and your Stop Loss in pips."
#property description "More free MT4 tools and guides: https://smartalgotrade.com"
#property strict
#property script_show_inputs

input double RiskPercent  = 1.0;   // Risk per trade (% of account balance)
input double StopLossPips = 30.0;  // Stop Loss distance (pips)

//+------------------------------------------------------------------+
//| Number of decimal places in the broker's lot step (0.01 -> 2)    |
//+------------------------------------------------------------------+
int LotDigits(double step)
  {
   int digits = 0;
   while(step < 0.999999 && digits < 8)
     {
      step *= 10.0;
      digits++;
     }
   return(digits);
  }

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   double balance   = AccountBalance();
   string currency  = AccountCurrency();
   double tickValue = MarketInfo(_Symbol, MODE_TICKVALUE);
   double tickSize  = MarketInfo(_Symbol, MODE_TICKSIZE);
   double minLot    = MarketInfo(_Symbol, MODE_MINLOT);
   double maxLot    = MarketInfo(_Symbol, MODE_MAXLOT);
   double lotStep   = MarketInfo(_Symbol, MODE_LOTSTEP);

   if(RiskPercent <= 0 || StopLossPips <= 0)
     {
      Alert("Lot Size Calculator: Risk % and Stop Loss must be greater than 0.");
      return;
     }
   if(balance <= 0 || tickValue <= 0 || tickSize <= 0 || lotStep <= 0)
     {
      Alert("Lot Size Calculator: symbol data is not available yet. Open a chart, wait for a price tick and try again.");
      return;
     }

//--- 1 pip = 10 points on 5/3-digit quotes, 1 point on 4/2-digit quotes
   double pip = (_Digits == 3 || _Digits == 5) ? _Point * 10.0 : _Point;

//--- money at risk and loss per 1.00 lot if the Stop Loss is hit
   double riskMoney  = balance * RiskPercent / 100.0;
   double lossPerLot = (StopLossPips * pip / tickSize) * tickValue;
   double rawLots    = riskMoney / lossPerLot;

//--- round down to the broker's lot step and keep inside min/max lot
   double lots = MathFloor(rawLots / lotStep + 1e-8) * lotStep;
   string note = "";
   if(lots < minLot)
     {
      lots = minLot;
      note = "\nWARNING: the minimum lot is larger than your risk. Real risk is higher than requested.";
     }
   if(lots > maxLot)
     {
      lots = maxLot;
      note = "\nNOTE: lot size was capped at the broker's maximum lot.";
     }

   int    ld         = LotDigits(lotStep);
   double actualRisk = lots * lossPerLot;

   string msg = "Lot Size Calculator - " + _Symbol +
                "\n\nBalance: " + DoubleToString(balance, 2) + " " + currency +
                "\nRisk: " + DoubleToString(RiskPercent, 2) + "% = " + DoubleToString(riskMoney, 2) + " " + currency +
                "\nStop Loss: " + DoubleToString(StopLossPips, 1) + " pips" +
                "\n\nLot size: " + DoubleToString(lots, ld) +
                "\nActual risk at this lot: " + DoubleToString(actualRisk, 2) + " " + currency +
                note +
                "\n\nFree tools & guides: smartalgotrade.com";

   Print(msg);
   MessageBox(msg, "Lot Size Calculator by Smart Algotrade", MB_OK | MB_ICONINFORMATION);
  }
//+------------------------------------------------------------------+
