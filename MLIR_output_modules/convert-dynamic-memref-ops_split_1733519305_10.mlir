module {
  func.func @prefetch(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    memref.prefetch %arg0[%arg1, %arg2], write, locality<3>, data : memref<?x?xf32>
    memref.prefetch %arg0[%arg1, %arg2], read, locality<0>, data : memref<?x?xf32>
    memref.prefetch %arg0[%arg1, %arg2], read, locality<2>, instr : memref<?x?xf32>
    return
  }
}