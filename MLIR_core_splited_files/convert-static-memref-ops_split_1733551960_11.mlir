module {
  func.func @static_store(%arg0: memref<10x42xf32>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<10x42xf32>
    return
  }
}