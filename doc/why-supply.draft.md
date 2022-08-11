# Why supply?

Most traders focus on price. However, the price can be easily manipulated. Anyone can place a buy order at a very high price for a very small amount. The price will go up, but most traders won't be happy because they won't be able to exit their full positions. So, what we **really want** is "higher exit liquidity", not "higher price".

"Higher exit liquidity" can be thought of as "higher available supply". You already own a supply of one asset, and you want to exchange it for supply of another asset. Every trade is just an exchange of supply.

In fact, the price can be defined in terms of two supplies. If we have an ABC-XYZ liquidity pool (Uniswap V2 style) that contains 5 ABC tokens and 100 XYZ tokens, then the price of 1 ABC token is 20 XYZ tokens. The general formula is: `price = pooled supply of XYZ / pooled supply of ABC`.

There are multiple different supplies:

The "demand" for the shares of a company is actually ordered supply (USD in orders to buy these shares). And it depends on two primary factors:

* The "risk-free" rate (how much USD return can be made by staking USD in US government bonds)
* The yield (how much the share pays) - which is "expected supply per share over period"!
  Basically, you're exchanging "supply-at-rest" (in your bank account) for the right to receive supply in future (the dividends).
