(* Given current history, prove that it is more likely to have a "positive" history in future *)

(* Positive future is defined as a history which:
 * - isPrehistory(future, past)
 * - contains(future, BuyAction)
 * - contains(future, SellAction)
 * - ourBalances(future) > ourBalances(past)
 *)

(* Notes:
 * - History is finite, since we live for a finite time
     - Maybe it's sufficient to use a simulation?
       - And faster to implement
         - Easier to find teammates
         - Easier to find code to reuse
       - And easier to extend (?)
       - And allows to take multiple assets into account
         - A proof for a single history doesn't allow to choose between two narratives
       - But may run into logical errors
         - But quite easy to test
       - But may require a lot of computational resources
         - But it's still cheaper than human resources
 *)
