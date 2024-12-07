module {
  func.func @static_load(%arg0: memref<10x42xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<10x42xf32>
    return
  }
}