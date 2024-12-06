module {
  func.func @assume_alignment(%arg0: memref<4x4xf16>) {
    memref.assume_alignment %arg0, 16 : memref<4x4xf16>
    return
  }
}