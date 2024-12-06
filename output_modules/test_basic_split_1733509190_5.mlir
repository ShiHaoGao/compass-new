module {
  %c0_i16 = hw.constant 0 : i16
  fsm.machine @M1() -> i16 attributes {initialState = "A"} {
    fsm.state @A output {
      fsm.output %c0_i16 : i16
    }
    fsm.state @B output {
      fsm.output %c0_i16 : i16
    }
  }
  fsm.machine @M2() -> i16 attributes {initialState = "A"} {
    fsm.state @A output {
      fsm.output %c0_i16 : i16
    }
    fsm.state @B output {
      fsm.output %c0_i16 : i16
    }
  }
}