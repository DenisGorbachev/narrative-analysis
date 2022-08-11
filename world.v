From mathcomp Require Import all_ssreflect.
Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Section POMDP

Variables (State : Type) (Belief : Type) (Action : Type) (Reward : Type)

Definition PartialPolicy := (b : Belief) -> (ma : Maybe Action)

(* Expected discounted value has the same type as reward, but it's calculated differently *)
Definition Value := Reward

(* (m : Message1) asserts the discounted expected value for taking (a : Action) at (s : State). *)
Structure Message1 := mkMessage
{ s: State
| a: Action
| v: Value
}

(* (m : Message2) asserts value of (p : PartialPolicy) at (b : Belief). *)
Structure Message2 := mkMessage
{ b: Belief
| pp: PartialPolicy
| v: Value
}

End Section.

(* 

# Message

## Hypothesis: Every Message is the result of a change of POMDP data

Examples:

* New information becomes available ("There is gold in America")
* New process becomes available ("It's possible to make dynamite")
* Someone's plans become available ("Fed is going to print dollars and buy stocks")

Notes:

* A message that contains only new data (without the policy) might also trigger an action. Examples:
  * Every advertisement (although the probability of an action is higher if the message contains a call-to-action)

# Actions

## Examples

* Subscribe to a channel
* Unsubscribe from a channel
* Get messages from a channel

*)