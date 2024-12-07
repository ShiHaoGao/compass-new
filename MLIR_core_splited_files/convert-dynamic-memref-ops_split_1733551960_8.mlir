module {
  func.func @mixed_load(%arg0: memref<42x?xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<42x?xf32>
    return
  }
}