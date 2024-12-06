module {
  fsm.machine @FSM(%arg0: i1, %arg1: i1) -> i8 attributes {initialState = "A"} {
    %c0_i8 = hw.constant 0 : i8
    fsm.state @A output {
      fsm.output %c0_i8 : i8
    } transitions {
      fsm.transition @B
    }
    fsm.state @B output {
      fsm.output %c0_i8 : i8
    } transitions {
      fsm.transition @A
    }
  }
  hw.module @top(in %arg0 : i1, in %arg1 : i1, in %clk : !seq.clock, in %rst : i1, out out : i8) {
    %0 = fsm.hw_instance "fsm_inst" @FSM(%arg0, %arg1), clock %clk, reset %rst : (i1, i1) -> i8
    hw.output %0 : i8
  }
}