module {
  func.func @assume_alignment_w_offset(%arg0: memref<4x4xf16, strided<[?, ?], offset: ?>>) {
    memref.assume_alignment %arg0, 16 : memref<4x4xf16, strided<[?, ?], offset: ?>>
    return
  }
}