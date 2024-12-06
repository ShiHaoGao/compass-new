module {
  fsm.machine @top(%arg0: i1, %arg1: i1) -> (i8, i8) attributes {argNames = ["a0", "a1"], initialState = "A", resNames = ["r0", "r1"]} {
    %c42_i8 = hw.constant 42 : i8
    fsm.state @A output {
      %c0_i8 = hw.constant 0 : i8
      fsm.output %c0_i8, %c42_i8 : i8, i8
    } transitions {
      fsm.transition @B
    }
    fsm.state @B output {
      %c1_i8 = hw.constant 1 : i8
      fsm.output %c1_i8, %c42_i8 : i8, i8
    } transitions {
      fsm.transition @A guard {
        %0 = comb.and %arg0, %arg1 : i1
        fsm.return %0
      }
    }
  }
}