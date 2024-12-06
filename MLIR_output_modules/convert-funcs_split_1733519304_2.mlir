module {
  func.func private @private_callee(%arg0: f32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
  func.func @caller_private_callee(%arg0: f32) -> i32 {
    %0 = call @private_callee(%arg0) : (f32) -> i32
    return %0 : i32
  }
}