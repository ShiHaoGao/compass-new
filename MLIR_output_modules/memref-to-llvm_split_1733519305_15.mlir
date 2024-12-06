module {
  func.func @generic_atomic_rmw(%arg0: memref<10xi32>, %arg1: index) {
    %0 = memref.generic_atomic_rmw %arg0[%arg1] : memref<10xi32> {
    ^bb0(%arg2: i32):
      memref.atomic_yield %arg2 : i32
    }
    llvm.return
  }
}