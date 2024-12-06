module {
  func.func @subview_leading_operands_dynamic(%arg0: memref<5x?xf32>) -> memref<3x?xf32, strided<[?, 1], offset: ?>> {
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c1 : memref<5x?xf32>
    %subview = memref.subview %arg0[2, 0] [3, %dim] [1, 1] : memref<5x?xf32> to memref<3x?xf32, strided<[?, 1], offset: ?>>
    return %subview : memref<3x?xf32, strided<[?, 1], offset: ?>>
  }
}