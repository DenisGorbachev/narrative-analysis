# How to trade

## Goals

### Get trading strategy

Inputs:

* [World model](#world-model) (skipping: it's easy to build a world model)
* [Trader policy](#trader-policy) (focusing)

Output: [trading strategy](#trading-strategy)

Type: (native)

Options:

* [Get trading strategy using theorem proving](#get-trading-strategy-using-theorem-proving)
* Get trading strategy using data mining
* Get trading strategy using reinforcement learning
* [Get trading strategy using a network of oracles](#get-trading-strategy-using-a-network-of-oracles)

Notes:

* There is only one fundamental way of betting: to bet on continuation (bet on laws)
  * Betting on changes is actually "betting on a specific reaction by market participants to a change", which is a form of betting on a continuation

### Get trading strategy using theorem proving

Options:

* [Get trading strategy based on narrative content](#get-trading-strategy-based-on-narrative-content)
* [Get trading strategy based on narrative spread form](#get-trading-strategy-based-on-narrative-spread-form)

### Get trading strategy based on narrative content

Notes:

* "Warren Buffet style" hypothesis: if we understand the business domain well enough, we can evaluate the narrative content well enough

### Get trading strategy based on narrative spread form

Notes:

* Hypothesis: if two people like one narrative and the distance between two people is "large", then the probability of other people liking this narrative is "large"
  * (a b : Person) -> (d : Distance a b) -> (n : Narrative) -> (ma : PositiveMention a n) -> (mb : PositiveMention b n) -> (Independent ma mb) -> ?

Options:

* Buy the [fundamental leader](definitions.md#fundamental-leader) of the most recent cycle
  * Design
    * Get the fundamental leaders of the most recent cycle
    * Wait until they fall below 80%
    * Buy

### Get trading strategy using a network of oracles

Notes:

* Examples
  * I knew that BNB will pump because I had a problem with ETH fees, and BNB was a good solution
* Draft
  * Build a network of people who "live in the future": have unusual problems & are looking for new solutions
  * Every week: get a list of pairs of (problem, solution)

### Trading strategy

Type: a function from a list of [events](definitions.md#event) and a [portfolio](definitions.md#portfolio) to a list of [trade plans](definitions.md#trade-plan).

Filters:

* Must be sane:
  * A list of trade plans must be less or equal to the portfolio
* Must be non-empty (there must exist a history such that the trading strategy outputs a non-empty list)
* Must protect from "quiet market"
  * Example
    * History
      * An original message with a "strong" positive narrative is posted
      * We open a long position
      * Other traders don't receive the message (e.g. they are subscribed but muted the notifications, or just dismissed the message)
      * The price doesn't change much
      * We should exit the long position
    * Notes
      * But BTCUSD price didn't move much after the COVID relief message
        * Maybe because BTCUSD traders weren't subscribed to Fed blog
* "Must make decisions before the trends are exhausted"
  * Example (bad):
    * Trading strategy takes 10 days to make a decision
    * The trend is over in 10 days
* Must work without errors if the list of events is [polydirectional](definitions.md#polydirectional)
  * May return an empty list of trade plans

Sorters:

* Should open both long & short positions
* Should divide sentiment by average sentiment
  * The average sentiment is above zero, so positive news don't receive as much of attention

Ideas:

* Exit:
  * Calculate the "balance price" according to new supply data
  * At every price higher than "balance price" sell some supply to maintain an equiprobable portfolio
* Use [Pulsars](definitions.md#pulsar)

Options:

* First draft

### Trading strategy - First draft

* Get channels
* Get latest messages from channel
* Get [sentinfos](definitions.md#sentinfo) from messages
* Get current form from sentinfos
* Get ideal form from ?
* If current form matches ideal form
  * Buy
* (condition)
  * Sell

### World model

Meaning: a set of static actors & behaviors

Examples of parts of the world model:

* Uniswap contract
* Aave contract
* Wheat futures specification
* Laws of physics
* Laws of biology
  * It's impossible to maintain life without external energy

### Trader policy

Options:

* [Retail policy](#retail-policy)
* [Whale policy](#whale-policy)
* [Bot policy](#bot-policy)

Notes:

* Some traders are bots

### Retail policy

Notes:

* Retail traders tend to use linear extrapolation

### Whale policy

Type: function from state to list of pairs (action, probability)

Thesis:

Basic notes:

* People make decisions based on narratives
* Narratives are logical predicates
  * They may or may not be true (it doesn't matter: if people think the narrative is valid, or if they have an incentive to spread it, they will spread it)
* Hypotheses:
  * A: We can predict people's actions from the narrative content
  * B: We can predict people's actions from the narrative spread form
  * C: A + B
* Count of messages increases probability of trading the narrative

Extra notes:

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

Game-theoretic situation:

* (c : Channel) -> (m : Message) -> (a : Asset) -> In c m -> Positive m a -> Influential c -> /-- a game-theoretic situation where you have to buy before others --/
  * A large account sends a positive message about a specific asset

Inertia:

* Some people might decide to buy an asset proportionally over time from a fixed amount of messages

## Bot policy
