module {
  hw.type_scope @fsm_enum_typedecls {
    hw.typedecl @FSM_state_t : !hw.enum<A, B>
  }
  emit.file "fsm_enum_typedefs.sv" {
    emit.ref @fsm_enum_typedecls
  }
  emit.fragment @FSM_ENUM_TYPEDEFS {
    sv.verbatim "`include \22fsm_enum_typedefs.sv\22"
  }
  hw.module @FSM(in %in0 : i1, in %in1 : i1, out out0 : i8, in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>  
    %c0_i8 = hw.constant 0 : i8
    %output_0 = sv.reg : !hw.inout<i8> 
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i8 : i8
      }
      case B: {
        sv.bpassign %state_next, %0 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i8 : i8
      }
      default: {
      }
    }
    %3 = sv.read_inout %output_0 : !hw.inout<i8>
    hw.output %3 : i8
  }
  hw.module @top(in %arg0 : i1, in %arg1 : i1, in %clk : !seq.clock, in %rst : i1, out out : i8) {
    %fsm_inst.out0 = hw.instance "fsm_inst" @FSM(in0: %arg0: i1, in1: %arg1: i1, clk: %clk: !seq.clock, rst: %rst: i1) -> (out0: i8)
    hw.output %fsm_inst.out0 : i8
  }
}

// -----
module {
  hw.type_scope @fsm_enum_typedecls {
    hw.typedecl @top_state_t : !hw.enum<A, B>
  }
  emit.file "fsm_enum_typedefs.sv" {
    emit.ref @fsm_enum_typedecls
  }
  emit.fragment @FSM_ENUM_TYPEDEFS {
    sv.verbatim "`include \22fsm_enum_typedefs.sv\22"
  }
  hw.module @top(in %a0 : i1, in %a1 : i1, out r0 : i8, out r1 : i8, in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>  
    %c42_i8 = hw.constant 42 : i8
    %c0_i8 = hw.constant 0 : i8
    %c1_i8 = hw.constant 1 : i8
    %3 = comb.and %a0, %a1 : i1
    %4 = comb.mux %3, %0, %1 : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
    %output_0 = sv.reg : !hw.inout<i8> 
    %output_1 = sv.reg : !hw.inout<i8> 
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i8 : i8
        sv.bpassign %output_1, %c42_i8 : i8
      }
      case B: {
        sv.bpassign %state_next, %4 : !hw.typealias<@fsm_enum_typedecls::@top_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c1_i8 : i8
        sv.bpassign %output_1, %c42_i8 : i8
      }
      default: {
      }
    }
    %5 = sv.read_inout %output_0 : !hw.inout<i8>
    %6 = sv.read_inout %output_1 : !hw.inout<i8>
    hw.output %5, %6 : i8, i8
  }
}

// -----
module {
  hw.type_scope @fsm_enum_typedecls {
    hw.typedecl @FSM_state_t : !hw.enum<A, B>
  }
  emit.file "fsm_enum_typedefs.sv" {
    emit.ref @fsm_enum_typedecls
  }
  emit.fragment @FSM_ENUM_TYPEDEFS {
    sv.verbatim "`include \22fsm_enum_typedefs.sv\22"
  }
  hw.module @FSM(in %in0 : i1, in %in1 : i1, out out0 : i16, in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>  
    %cnt_next = sv.reg : !hw.inout<i16> 
    %c0_i16 = hw.constant 0 : i16
    %3 = sv.read_inout %cnt_next : !hw.inout<i16>
    %cnt_reg = seq.compreg sym @cnt_reg %3, %clk reset %rst, %c0_i16 : i16  
    %c0_i16_0 = hw.constant 0 : i16
    %c1_i16 = hw.constant 1 : i16
    %4 = comb.add %cnt_reg, %c1_i16 : i16
    %5 = comb.mux %in0, %0, %1 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
    %output_0 = sv.reg : !hw.inout<i16> 
    sv.alwayscomb {
      sv.bpassign %cnt_next, %cnt_reg : i16
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %cnt_reg : i16
      }
      case B: {
        sv.bpassign %state_next, %5 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
        sv.case %2 : !hw.typealias<@fsm_enum_typedecls::@FSM_state_t, !hw.enum<A, B>>
        case A: {
          sv.bpassign %cnt_next, %4 : i16
        }
        case B: {
        }
        default: {
        }
        sv.bpassign %output_0, %cnt_reg : i16
      }
      default: {
      }
    }
    %6 = sv.read_inout %output_0 : !hw.inout<i16>
    hw.output %6 : i16
  }
}

// -----
module {
  hw.type_scope @fsm_enum_typedecls {
    hw.typedecl @M2_state_t : !hw.enum<A, B>
    hw.typedecl @M1_state_t : !hw.enum<A, B>
  }
  emit.file "fsm_enum_typedefs.sv" {
    emit.ref @fsm_enum_typedecls
  }
  emit.fragment @FSM_ENUM_TYPEDEFS {
    sv.verbatim "`include \22fsm_enum_typedefs.sv\22"
  }
  hw.module @M1(in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>  
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %0 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
      }
      case B: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
      }
      default: {
      }
    }
    hw.output
  }
  hw.module @M2(in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>  
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %0 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
      }
      case B: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
      }
      default: {
      }
    }
    hw.output
  }
}

// -----
module {
  hw.type_scope @fsm_enum_typedecls {
    hw.typedecl @M2_state_t : !hw.enum<A, B>
    hw.typedecl @M1_state_t : !hw.enum<A, B>
  }
  emit.file "fsm_enum_typedefs.sv" {
    emit.ref @fsm_enum_typedecls
  }
  emit.fragment @FSM_ENUM_TYPEDEFS {
    sv.verbatim "`include \22fsm_enum_typedefs.sv\22"
  }
  %c0_i16 = hw.constant 0 : i16
  hw.module @M1(out out0 : i16, in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>  
    %c0_i16_0 = hw.constant 0 : i16
    %output_0 = sv.reg : !hw.inout<i16> 
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %0 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i16_0 : i16
      }
      case B: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@M1_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i16_0 : i16
      }
      default: {
      }
    }
    %3 = sv.read_inout %output_0 : !hw.inout<i16>
    hw.output %3 : i16
  }
  hw.module @M2(out out0 : i16, in %clk : !seq.clock, in %rst : i1) attributes {emit.fragments = [@FSM_ENUM_TYPEDEFS]} {
    %A = hw.enum.constant A : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %to_A = sv.reg sym @A : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    sv.assign %to_A, %A : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %0 = sv.read_inout %to_A : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %B = hw.enum.constant B : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %to_B = sv.reg sym @B : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    sv.assign %to_B, %B : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
    %1 = sv.read_inout %to_B : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %state_next = sv.reg : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>> 
    %2 = sv.read_inout %state_next : !hw.inout<typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>>
    %state_reg = seq.compreg sym @state_reg %2, %clk reset %rst, %0 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>  
    %c0_i16_0 = hw.constant 0 : i16
    %output_0 = sv.reg : !hw.inout<i16> 
    sv.alwayscomb {
      sv.case %state_reg : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
      case A: {
        sv.bpassign %state_next, %0 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i16_0 : i16
      }
      case B: {
        sv.bpassign %state_next, %1 : !hw.typealias<@fsm_enum_typedecls::@M2_state_t, !hw.enum<A, B>>
        sv.bpassign %output_0, %c0_i16_0 : i16
      }
      default: {
      }
    }
    %3 = sv.read_inout %output_0 : !hw.inout<i16>
    hw.output %3 : i16
  }
}

