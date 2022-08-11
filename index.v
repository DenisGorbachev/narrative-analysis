Definition Wallet : Type (* Take from Zenbox *)

Definition Portfolio := List Wallet

Record WorldPartial := mkWorldPartial
{ portfolio : Portfolio
;
}

Record CreateAssetAction := mkCreateAssetAction
{ id : AssetId
| owner : UserId
| balances : Balances
}

Record UpdatePoolAction := mkUpdatePoolAction
{ poolId : Nat
| diffX : Z
| diffY : Z
}

Inductive Action : Set :=
| CreateAsset :  -> Action
| TransferAsset : (id : AssetId) -> (from : UserId) -> (to : UserId) -> (amount : Amount) -> Action
| AddLiquidity : (p : Pool) -> (ax : Amount) -> (ay : Amount) -> Action
| RemoveLiquidity : (p : Pool) -> (ax : Amount) -> (ay : Amount) -> Action
| RemoveLiquidity : (p : Pool) -> (ax : Amount) -> (ay : Amount) -> Action

Definition History := List Action

Fixpoint isValidHistory (history : History) : bool := match h with
| [] => true
| action :: prehistory => isValidAction(action) && balances(history) = balances(prehistory) && isValidHistory(prehistory)
(*
 * The pool rule is maintained (x * y = k)
 * The balances are maintained (sumBalances(h') = sumBalances(h))
 *)


(* Fixed population *)

Definition Population : Type
Definition Narrative : Type
Definition Memory : Type

(* It is possible to determine the spread of the narrative from the internal structure of the population and the narrative *)
Definition virality (p : Population) (n : Narrative) : Virality.

(* Local virality is a probability that a person will push a message onto the channel *)
Record LocalVirality := mkLocalVirality
{ probability :> Probability
; person :> Person
; channel :> Channel
}

Record Person := mkPerson
{ propositions : Ensemble Prop (* statements *)
  energy: Nat
}

(* Axioms:
 * Physics
   * Person requires multiple resources
     * Person dies if it has less than lower bound for resource
     * Person dies if it has more than upper bound for resource
     * Notes
        * Multiple resources are necessary to prove the emergence of trading
   * Person resources decrease with time
   * Person can take an action that gets a resource from environment
     * Gives resource with with p > 0 /\ p < 1
     * Since every action takes time, the action takes resources
   * Person "learns" an action
     * The probability distribution parameters "improve", so that the expectation of return increases
     * The speed of action decreases
     * The amount of resource increases
   * Person must lose some energy before taking more energy from environment ("invest" energy)
   * Environment may or may not provide more energy to the person
   * In the limit, Environment does provide more energy to the persons
   * There is a non-zero probability of a person dying (inverse-log-normal distribution)
   * There is a non-zero probability of two people taking the same action to produce another person
     * Takes energy with p = 1
     * Produces a person with p > 0 /\ p < 1
   * People maximize a "happiness function" that has the following properties:
     * Is not equal to the amount of energy
     * Increases with getting enough energy without overeating
     * Increases with trying to have an offspring
     * Increases when an offspring is produced
     * Decreases when an offspring dies
 * Psychology (implied by physics)
   * People are more likely to spread the narrative that benefits their position ("pump their bags")
 *)

(* Population has a list of humans *)
Definition getPeople (p : Population) : List Person.

(* A human has memory *)
Definition getMemory (p : Person) : Memory

(* A narrative is considered valid if it can be proven by fact-checking *)
Record Valid (n : Narrative) := {}

(* A narrative is considered valid when ... (open question) *)
Record Viral (vn : Valid Narrative) := {}

(* Every Viral narrative is Valid *)
(* Not every Valid narrative is Viral *)

(* Definitions:
 * https://www.cs.cmu.edu/afs/cs/project/jair/pub/volume23/roy05a-html/node2.html
 * [David Masters Thesis](https://etd.ohiolink.edu/apexprod/rws_etd/send_file/send?accession=ohiou1618999718015199&disposition=inline)
   * Has Coq code
 *)



Section ChannelDef
(* Notes:
 * Subscribe/Unsubscribe is just a secondary action that updates the aggregate channel
 *)

(* Channels are coinductive *)
Definition Channel := Stream

End Section.

Section Narrative
(* Examples:
 * Buy Bitcoin because Fed is printing dollars.
 * Provide liquidity on Uniswap to get LP fees.
 * Trade on Uniswap to avoid KYC.
 * Buy an NFT from "The Saudis" collection because it will attract a lot of attention as a cool meme
 *)
(* Notes:
 * Narrative is the result of the change of the world
 * Maybe Narrative could be modelled as a logical statement (Theorem / Axiom)
 * Every valid phrase can be modelled as a logical statement
 * The narratives in the examples are statements about the future ("discounted rewards")
 * Narrative is valid if it can be proved from existing axioms
 *)

End Section.

Section ActionDef
(* Notes
 * Set of actions must contain the following actions: Buy, Sell, GetUpdates, ValidateUpdate
 *)

End Section
