module {
  fsm.machine @foo(%arg0: i1) -> i1 attributes {initialState = "A"} {
    %true = arith.constant true
    fsm.state @A output {
      fsm.output %true : i1
    } transitions {
      fsm.transition @A
    }
    fsm.state @B output {
      fsm.output %true : i1
    } transitions {
      fsm.transition @A
    }
  }
}