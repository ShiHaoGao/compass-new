module {
  func.func @subview_leading_operands(%arg0: memref<5x3xf32>, %arg1: memref<5x?xf32>) -> memref<3x3xf32, strided<[3, 1], offset: 6>> {
    %subview = memref.subview %arg0[2, 0] [3, 3] [1, 1] : memref<5x3xf32> to memref<3x3xf32, strided<[3, 1], offset: 6>>
    return %subview : memref<3x3xf32, strided<[3, 1], offset: 6>>
  }
}