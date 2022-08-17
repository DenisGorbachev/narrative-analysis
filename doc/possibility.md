# Is it possible to design a profitable trading strategy?

Assumptions:

* Traders make decisions according to rules
  * Different traders have different rules
  * A single trader may change his/her rules
  * A single trader may choose between different rules probabilistically

## Notes

* The world structure may change
* Every change has a precursor
* A precursor may be something completely different (e.g. Bitcoin, Uniswap)
* The precursor needs a test
* The test is equal to stress test
* Simplicity increases the speed of spread
* Efficiency = strength / energy
* Lower probability of price increase may or may not be reflected in the current price
  * Examples
    * When Bitcoin went down during the first cycle, lots of people declared that it was dead
* If asset A is a production input for asset B (is used during production), then increased demand for B leads to increased demand for A
  * (a b : Asset) -> a |ProductionInput| b -> (t1 t2 : Timestamp) -> (t2 > t1) -> (demand b t2 > demand b t1) -> (demand a t2 > demand a t1)
* If asset A is a production input for asset B, and there are many producers of B, then asset A price is more stable than a single producer share price
  * Examples
    * Ethereum is more stable than any shitcoin

## Notes 2

* The trades happen between two people
* The behavior of people is not random
* The behavior of a group of people is less random that the behavior of a single person
  * Some people from the group may reject the idea of a single person, thus influencing him to abandon his idea

## Notes 3

* The probability of trading according to info increases superlinearly with the incremental increase of count of consumptions of this info
