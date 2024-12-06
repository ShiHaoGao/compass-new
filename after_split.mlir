module {
  calyx.component @main(%go: i1 {go}, %reset: i1 {reset}, %clk: i1 {clk}) -> (%done: i1 {done}) {
    %c2_i8 = hw.constant 2 : i8
    %c1_i8 = hw.constant 1 : i8
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %a.in, %a.write_en, %a.clk, %a.reset, %a.out, %a.done = calyx.register @a : i8, i1, i1, i1, i8, i1
    %b.in, %b.write_en, %b.clk, %b.reset, %b.out, %b.done = calyx.register @b : i8, i1, i1, i1, i8, i1
    %c.in, %c.write_en, %c.clk, %c.reset, %c.out, %c.done = calyx.register @c : i8, i1, i1, i1, i8, i1
    calyx.wires {
      %0 = calyx.undef : i1
      calyx.group @A {
        calyx.assign %a.in = %c0_i8 : i8
        calyx.assign %a.write_en = %true : i1
        calyx.group_done %a.done : i1
      }
      calyx.group @B {
        calyx.assign %b.in = %c1_i8 : i8
        calyx.assign %b.write_en = %true : i1
        calyx.group_done %b.done : i1
      }
      calyx.group @C {
        calyx.assign %c.in = %c2_i8 : i8
        calyx.assign %c.write_en = %true : i1
        calyx.group_done %c.done : i1
      }
    }
    calyx.control {
      fsm.machine @control(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1) -> (i1, i1, i1, i1) attributes {calyx.fsm_group_done_inputs = {A = 2 : i64, B = 1 : i64, C = 0 : i64}, calyx.fsm_group_go_outputs = {A = 2 : i64, B = 1 : i64, C = 0 : i64}, calyx.fsm_top_level_done = 3 : i64, calyx.fsm_top_level_go = 3 : i64, compiledGroups = [@C, @B, @A], initialState = "fsm_entry"} {
        %true_0 = hw.constant true
        %false = hw.constant false
        fsm.state @fsm_entry output {
          fsm.output %false, %false, %false, %false : i1, i1, i1, i1
        } transitions {
          fsm.transition @seq_0_A guard {
            %0 = comb.icmp eq %b.in, %a.in : i8
            fsm.return %0
          }
        }
        fsm.state @fsm_exit output {
          fsm.output %false, %false, %false, %true_0 : i1, i1, i1, i1
        }
        fsm.state @seq_2_C output {
          fsm.output %true_0, %false, %false, %false : i1, i1, i1, i1
        } transitions {
          fsm.transition @fsm_exit guard {
            fsm.return %arg0
          }
        }
        fsm.state @seq_1_B output {
          fsm.output %false, %true_0, %false, %false : i1, i1, i1, i1
        } transitions {
          fsm.transition @seq_2_C guard {
            fsm.return %arg1
          }
        }
        fsm.state @seq_0_A output {
          fsm.output %false, %false, %true_0, %false : i1, i1, i1, i1
        } transitions {
          fsm.transition @seq_1_B guard {
            fsm.return %arg2
          }
        }
      }
    }
  }
}

