module {
  func.func @subview_negative_stride(%arg0: memref<7xf32>) -> memref<7xf32, strided<[-1], offset: 6>> {
    %subview = memref.subview %arg0[6] [7] [-1] : memref<7xf32> to memref<7xf32, strided<[-1], offset: 6>>
    return %subview : memref<7xf32, strided<[-1], offset: 6>>
  }
}