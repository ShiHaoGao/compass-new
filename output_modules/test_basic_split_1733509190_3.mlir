module {
  fsm.machine @FSM(%arg0: i1, %arg1: i1) -> i16 attributes {initialState = "A"} {
    %cnt = fsm.variable "cnt" {initValue = 0 : i16} : i16
    %c0_i16 = hw.constant 0 : i16
    %c1_i16 = hw.constant 1 : i16
    fsm.state @A output {
      fsm.output %cnt : i16
    } transitions {
      fsm.transition @B
    }
    fsm.state @B output {
      fsm.output %cnt : i16
    } transitions {
      fsm.transition @A guard {
        fsm.return %arg0
      } action {
        %0 = comb.add %cnt, %c1_i16 : i16
        fsm.update %cnt, %0 : i16
      }
    }
  }
}