module {
  fsm.machine @M1() attributes {initialState = "A"} {
    fsm.state @A
    fsm.state @B
  }
  fsm.machine @M2() attributes {initialState = "A"} {
    fsm.state @A
    fsm.state @B
  }
}