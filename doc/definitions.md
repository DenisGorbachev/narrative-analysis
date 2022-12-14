# Definitions

[Tree of Alpha origins - news trading](https://twitter.com/Tree_of_Alpha/status/1564012565675532289)

## Portfolio

Type: a list of [bags](#bag)

## Portfolio chunk

Type: a structure with the following fields:

* bags: List of [bags](#bag)
* proof of bags not being empty : NonEmpty bags
* proof of bags being less than or equal to portfolio : bags <= portfolio

## Borrowable portfolio

Type: [portfolio](#portfolio) that could be borrowed by locking an existing [portfolio chunk](#portfolio-chunk)

## Bag

Type: a structure with the following fields:

* [Amount](#amount)
* [Asset](#asset)

## Channel

Meaning: a source of [messages](#message)

Type: a structure with the following fields:

* network : Network
* name : String
* username : Username
* followerCount : Nat
* registeredAt : Date
* owner : Option Person

Projections:

* Trade power: probability distribution of aggregate [borrowable portfolio](#borrowable-portfolio) (optional)
* Share power: probability distribution of aggregate [channels](#channel) (optional)
  * Options
    * list of pairs of (channel, probability distribution)
    * probability distribution of list of channels
* Getter: a function from the World monad to a list of [messages](#message)

Examples:

* Twitter account
* Twitter feed (aggregate channel)
* Push notifications on a personal phone

Notes:

* Channels never push messages, only allow the user to pull the messages explicitly
  * When an app sends a push notification, we model it as "the app copies the message from its internal database into the user's phone database"
* Channels may have different amount of traders with different margin preferences (represented by `Power` field)

## Channel archetype

* Blog
* Forum
* RSS feed
* News aggregator feed
* Social network feed
* Social network channel
* Social network group
* Social network account
* Social network direct

## Channel type

* 4chan
* Email inbox
* Bloomberg feed
* Offline meeting
* Lens protocol feed
* Telegram group
* Telegram channel
* Telegram direct
* Twitter account
* Twitter feed
* Twitter direct
* Reddit subreddit
* Reddit frontpage
* Reddit direct
* Facebook account
* Facebook page
* Facebook feed
* Facebook direct
* Instagram account
* Instagram feed
* Instagram direct
* TikTok account
* TikTok feed
* TikTok direct
* YouTube channel
* YouTube feed
* YouTube recommendations
* Discord server
* Discord channel
* Discord direct
* Medium publication
* Medium account
* TradingView feed
* Stocktwits feed
* Stocktwits account
* Stocktwits direct

## Message

Meaning: an update of the world state in raw format

Type: structure with the following fields:

* channel : [Channel](#channel)
* text : String
* image : String (base64-encoded)
* timestamp : Date

## Derivative message

Meaning: [a message](#message) that has the same [info](#info) as the earlier message (called a "parent message")

## Info

Meaning: the actual information extracted from a [message](#message)

Important: info is equal to [event](#event) (we say that "messages describe events")

## Sentinfo

Type: a structure with the following fields:

* asset : [Asset](#asset)
* sentiment : [Sentiment](#sentiment)
* message : [Message](#message)

## Polydirectional

Type: a list of structures that have a [sentiment](#sentiment) field where at least two structures have a different sentiment sign (excluding zero)

## Person

Type: a structure with the following fields:

* name : Option Name -- sometimes we don't know the real name
* contacts : List Contact

## Contact

Type: a structure with the following fields:

* protocol : Protocol
* value : String

## Event

Meaning: an update of the world state in precise format

(incomplete)

Options:

* A list of supply predicates (because price is a ratio of two supplies)

Filters:

* Must encode the influence on supply

## Trader

Type: a structure with the following fields:

* Activation count probability distribution (how many messages the trader needs to receive in order to trade according to the narrative)
  * Fields:
    * Form: log-normal
    * Parameters
      * Mean
      * Standard deviation

## Supply

Synonym of "[Amount](#amount)".

## Amount

Meaning: normalized amount of asset without decimals (example: "10.4 USD" is written as "1040 USD supply", because USD has 2 decimals)

Type: natural number (important: see [Get amount type](#get-amount-type))

Notes:

* Important: supply doesn't have decimals, so we need to convert "displayed amounts" in the messages to "normalized amounts" (multiply by `10 ^ asset.decimals`)

## Trade plan

Type: a structure with the following fields:

* amount: [Amount](#amount) (of "source" asset)
* source: [Asset](#asset)
* target: [Asset](#asset)

## Asset

Type: a structure with the following fields:

* name: String
* decimals: Natural number

## Sizer

Meaning: a way to determine what parts of your current portfolio you should trade for another asset

Type: a function from [portfolio](#portfolio) to [portfolio chunk](#portfolio-chunk)

## Get amount type

Options:

* Natural number
* Decimal number with fixed precision
* Decimal number with dynamic precision
* Floating point number
* Bignumber

Filters:

* Must be precise (calculations must not lose data)

Sorters:

* Should be simple

Decision: Natural number

## Get virality probability

Options:

* Difference between the current [message spread](#message-spread) & the ideal [message spread](#message-spread)
  * Must normalize by total message count over all channels
    * Otherwise we'll see ever-increasing message counts, just because a certain social network is becoming more popular
  * Get the ideal message spread from historical data

Notes:

* Virality can be determined by:
  * Message info (how it is interpreted by the population)
  * Message spread (how it spreads within the population)

## Message spread

Notes:

## Sentiment

Type: a floating point number in \[-1; 1\] range

## Sentiment coherence

Type: squared difference between sentiments of two messages

## Radioactivity

Type: a probability of a specific message being traded upon by a specific person

## Virality

Type: a probability of a specific message being shared by a specific person

## Fundamental leader

Meaning: an asset that was associated with a product that experienced high usage during the cycle.

Type: Cycle -> Asset

Examples:

* Ethereum
* Solana
* Yearn

## Pulsar

Meaning: a person who **continuously** produces messages related to the same narrative.

Notes:

* (p : Pulsar) -> (n m : Narrative) -> (Variance n >= Variance m) -> (length (available_messages p n) >= length (available_messages p m))

## VarianceS

Type: structure with the following fields:

* qv : [QuestionVariance](#QuestionVariance)
* tv : [TopicVariance](#TopicVariance)
* stv : [SocialTypeVariance](#SocialTypeVariance)

## TopicVariance

Meaning: count of topics raised by the message

## QuestionVariance

Meaning: count of questions raised by the message

### SocialTypeVariance

Meaning: count of sociotypes activated by the message

### Balanceness

Meaning: ?
