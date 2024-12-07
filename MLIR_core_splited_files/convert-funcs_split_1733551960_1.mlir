module {
  func.func private @second_order_arg(() -> ())
  func.func private @second_order_result() -> (() -> ())
  func.func private @second_order_multi_result() -> (() -> i32, () -> i64, () -> f32)
  func.func private @memref_call_conv(memref<?xf32>)
  func.func private @memref_call_conv_nested((memref<?xf32>) -> ())
  func.func @pass_through(%arg0: () -> ()) -> (() -> ()) {
    cf.br ^bb1(%arg0 : () -> ())
  ^bb1(%0: () -> ()):  // pred: ^bb0
    return %0 : () -> ()
  }
  func.func private @llvmlinkage(i32) attributes {llvm.linkage = #llvm.linkage<extern_weak>}
  func.func private @llvmreadnone(i32) attributes {llvm.readnone}
  func.func private @body(i32)
  func.func @indirect_const_call(%arg0: i32) {
    %f = constant @body : (i32) -> ()
    call_indirect %f(%arg0) : (i32) -> ()
    return
  }
  func.func @indirect_call(%arg0: (f32) -> i32, %arg1: f32) -> i32 {
    %0 = call_indirect %arg0(%arg1) : (f32) -> i32
    return %0 : i32
  }
  func.func @variadic_func(%arg0: i32) attributes {func.varargs = true} {
    return
  }
  func.func private @target_cpu() attributes {target_cpu = "gfx90a"}
  func.func private @target_features() attributes {target_features = #llvm.target_features<["+sme", "+sve"]>}
}