# How to trade

## Goals

### Get trading strategy

Type: a function from a list of [events](definitions.md#event) and a [portfolio](definitions.md#portfolio) to a list of [trade plans](definitions.md#trade-plan).

Filters:

* Must be sane:
  * A list of trade plans must be less or equal to the portfolio
* Must be non-empty (there must exist a history such that the trading strategy outputs a non-empty list)

Ideas:

* Exit:
  * Calculate the "balance price" according to new supply data
  * At every price higher than "balance price" sell some supply to maintain an equiprobable portfolio
