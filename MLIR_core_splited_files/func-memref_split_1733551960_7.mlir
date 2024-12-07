module {
  func.func private @goo(f32) -> f32
  func.func @check_scalar_func_call(%arg0: f32) {
    %0 = call @goo(%arg0) : (f32) -> f32
    return
  }
}