module {
  func.func @dynamic_load(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<?x?xf32>
    return
  }
}