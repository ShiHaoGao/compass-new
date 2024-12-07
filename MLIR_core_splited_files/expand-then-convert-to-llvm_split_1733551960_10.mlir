module {
  func.func @subview_rank_reducing_leading_operands(%arg0: memref<5x3xf32>) -> memref<3xf32, strided<[1], offset: 3>> {
    %subview = memref.subview %arg0[1, 0] [1, 3] [1, 1] : memref<5x3xf32> to memref<3xf32, strided<[1], offset: 3>>
    return %subview : memref<3xf32, strided<[1], offset: 3>>
  }
}