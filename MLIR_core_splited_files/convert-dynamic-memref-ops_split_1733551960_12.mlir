module {
  func.func @mixed_store(%arg0: memref<42x?xf32>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<42x?xf32>
    return
  }
}