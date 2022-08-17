# How to trade

## Goals

### Get trading strategy

Inputs:

* [World model](#world-model) (skipping: it's easy to build a world model)
* [Human policy](#human-policy) (focusing)

Output: [trading strategy](#trading-strategy)

Type: (native)

### Trading strategy

Type: a function from a list of [events](definitions.md#event) and a [portfolio](definitions.md#portfolio) to a list of [trade plans](definitions.md#trade-plan).

Filters:

* Must be sane:
  * A list of trade plans must be less or equal to the portfolio
* Must be non-empty (there must exist a history such that the trading strategy outputs a non-empty list)

Ideas:

* Exit:
  * Calculate the "balance price" according to new supply data
  * At every price higher than "balance price" sell some supply to maintain an equiprobable portfolio

### World model

Meaning: a set of static actors & behaviors

Examples of parts of the world model:

* Uniswap contract
* Aave contract
* Wheat futures specification
* Laws of physics
* Laws of biology
  * It's impossible to maintain life without external energy

### Human policy

Options:

* [Whale policy](#whale-policy)

### Whale policy

Type: function from state to list of pairs (action, probability)

Thesis:

* People make decisions based on narratives
* Narratives are logical predicates
  * They may or may not be true (it doesn't matter: if people think the narrative is valid, or if they have an incentive to spread it, they will spread it)
* Hypothesis: we can predict people's actions from (either the narrative content or the narrative spread form)
  * Hypothesis: if two people like one narrative and the distance between two people is "large", then the probability of other people liking this narrative is "large"
    * (a b : Person) -> (d : Distance a b) -> (n : Narrative) -> (ma : PositiveMention a n) -> (mb : PositiveMention b n) -> (Independent ma mb) -> ?
* Another hypothesis ("Warren Buffet style"): if we understand the business domain well enough, we can evaluate the narrative content well enough

Notes:

* Most humans have life-preserving instincts
* Most humans don't change their behavior if it is "profitable"
* There are psychoviruses: propositions that can't be proven or disproven, but that predict a huge negative outcome if ignored
  * "Hell" (religions)
  * "Send this message to 5 friends, or you will lose money"
  * "Buy Bitcoin now because there will be YUUUGE inflation"
* The psychoviruses are the strongest narratives, because they trigger fear
* If an asset is "tainted" by a negative narrative, investors will exchange this asset for a "safe" asset
* There is "contagion": if an asset is "tainted" by a narrative, investors may sell related assets
* Probability of action decreases if this action was unsuccessful
  * People do it more abruptly: they continue trying multiple times, then stop doing it completely
