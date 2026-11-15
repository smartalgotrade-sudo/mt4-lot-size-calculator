# MT4 Lot Size Calculator + Expert Advisor Guide

A **free risk-based lot size calculator for MetaTrader 4**, plus a practical guide to installing and running Expert Advisors (Forex robots) on MT4.

Made by [Smart Algotrade](https://smartalgotrade.com) - developers of automated Forex trading robots for MT4 since 2015.

---

## What the Lot Size Calculator does

Proper position sizing is the base of every trading strategy, manual or automated. This MQL4 script tells you **exactly what lot size to use** so that if your Stop Loss is hit, you lose only the percent of your balance you chose.

You enter:

- **Risk per trade** - percent of account balance (default 1%)
- **Stop Loss** - distance in pips (default 30)

The script shows:

- The lot size, rounded down to your broker's lot step
- The amount of money at risk, in your account currency
- A warning if your broker's minimum lot is bigger than your chosen risk

It works with any MT4 broker, 4 or 5-digit quotes, Forex pairs, metals and indices (it uses the symbol's tick value from your broker).

**Example:** balance $5,000, risk 1%, Stop Loss 25 pips on EURUSD → risk $50 → lot size **0.20**.

## How to install the script in MT4

1. Download [`LotSizeCalculator.mq4`](LotSizeCalculator.mq4) from this repository.
2. In MetaTrader 4, click **File → Open Data Folder**.
3. Open the folder **MQL4 → Scripts** and copy the file there.
4. Back in MT4, right-click **Scripts** in the **Navigator** window and choose **Refresh**.
5. Drag **LotSizeCalculator** onto the chart of the pair you want to trade.
6. Enter your risk % and Stop Loss in pips, then click **OK**.

The result appears in a pop-up window and in the **Experts** tab of the terminal.

---

## Guide: how to install an Expert Advisor (Forex robot) in MT4

Full guide: [Install an Expert Advisor into MetaTrader 4](https://www.smartalgotrade.com/install-expert-advisor-into-metatrader-4/)

1. Click **File → Open Data Folder** and open **MQL4 → Experts**.
2. Copy the Expert Advisor file (`.ex4` or `.mq4`) into this folder.
3. Restart MT4, or right-click **Expert Advisors** in the Navigator and choose **Refresh**.
4. Click **Tools → Options → Expert Advisors** and check **Allow automated trading**. If the robot needs a license check or news data, also check **Allow WebRequest** and add the required URL.
5. Drag the Expert Advisor onto the correct chart and timeframe.
6. In the **Common** tab, check **Allow live trading**, then set the inputs and click **OK**.
7. Make sure the **AutoTrading** button on the toolbar is green and a smiley face appears in the top-right corner of the chart.

**Tip:** an Expert Advisor trades only while MT4 is open. For 24/5 trading, run MT4 on a VPS.
### Expert Advisor not trading? Common problems

| Problem | Fix |
|---|---|
| Sad face on the chart | Enable **AutoTrading** and **Allow live trading** |
| "Trade is disabled" in the journal | The symbol is closed or your account is read-only (investor password) |
| "Invalid stops" | Stop Loss is too close to the price for your broker |
| "Not enough money" | Lot size is too big for your balance - use the calculator above |
| No trades for days | Some strategies trade rarely by design - check the robot's settings and timeframe |

Full troubleshooting guide: [Why your MT4 Expert Advisor is not trading](https://www.smartalgotrade.com/algo-trading-blog/mt4-expert-advisor-not-trading/)

---

## More free Algo Trading guides

From the [Smart Algotrade Algo Trading Blog](https://www.smartalgotrade.com/category/algo-trading-blog/):

- [How to run multiple Expert Advisors on one MT4 account](https://www.smartalgotrade.com/algo-trading-blog/run-multiple-expert-advisors-one-mt4-account/)
- [How to read an MT4 backtest report](https://www.smartalgotrade.com/algo-trading-blog/how-to-read-an-mt4-backtest-report/)
- [How to know if an Expert Advisor backtest is reliable](https://www.smartalgotrade.com/algo-trading-blog/how-to-know-if-an-expert-advisor-backtest-is-reliable/)
- [How much drawdown is acceptable for an Expert Advisor](https://www.smartalgotrade.com/algo-trading-blog/how-much-drawdown-is-acceptable-for-an-expert-advisor/)
- [How much money do you need to start algo trading](https://www.smartalgotrade.com/algo-trading-blog/how-much-money-do-you-need-to-start-algo-trading/)
- [How to spot a scam Expert Advisor](https://www.smartalgotrade.com/algo-trading-blog/how-to-spot-a-scam-expert-advisor/)
- [Why most Expert Advisors fail](https://www.smartalgotrade.com/algo-trading-blog/why-most-expert-advisors-fail/)
- [Algo trading passive income for beginners](https://www.smartalgotrade.com/algo-trading-blog/algo-trading-passive-income-for-beginners/)

---

## About Smart Algotrade

[Smart Algotrade](https://smartalgotrade.com) develops automated Forex trading robots for MetaTrader 4:

- **[Double FX Robot](https://smartalgotrade.com/free-fx-robot/)** - our leading robot, combining two algo trading strategies
- **[Smart Forex Robot](https://smartalgotrade.com/smart-forex-robot/)**
- **[Forex Trading Robot](https://smartalgotrade.com/forex-trading-robot/)**

All robots are free for one year when you open an account with our partner brokers.

YouTube: [@Smartalgotrade](https://www.youtube.com/@Smartalgotrade) · Medium: [@smartalgotrade](https://medium.com/@smartalgotrade) · Telegram: [Smart_AlgoTrade](https://t.me/Smart_AlgoTrade)

---

*Risk warning: Forex trading involves significant risk and is not suitable for every investor. Past performance does not guarantee future results. This tool is provided free, as is, for educational purposes.*
