module {
  func.func @check_noalias(%arg0: memref<2xf32> {llvm.noalias}, %arg1: memref<2xf32> {llvm.noalias}) {
    return
  }
}