module {
  func.func @check_arguments(%arg0: memref<10x20xf32>, %arg1: memref<?x?xf32>, %arg2: memref<10x?xf32>) {
    return
  }
}