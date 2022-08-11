# Definitions

## Portfolio

Type: a list of [bags](#bag)

## Portfolio chunk

Type: a structure with the following fields:

* bags: List of [bags](#bag)
* Proof of bags not being empty
* Proof of bags being less than or equal to portfolio

## Bag

Type: a structure with the following fields:

* [Amount](#amount)
* [Asset](#asset)

## News

Meaning: an update of the world state in raw format

Type: text (natural language)

## Event

Meaning: an update of the world state in precise format

(incomplete)

Options:

* A list of supply predicates (because price is a ratio of two supplies)

Filters:

* Must encode the influence on supply

## Supply

Synonym of "[Amount](#amount)".

## Amount

Meaning: normalized amount of asset without decimals (example: "10.4 USD" is written as "1040 USD supply", because USD has 2 decimals)

Type: natural number (important: see [Get amount type](#get-amount-type))

Notes:

* Important: supply doesn't have decimals, so we need to convert "displayed amounts" in the events to "normalized amounts" (multiply by `10 ^ asset.decimals`)

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
