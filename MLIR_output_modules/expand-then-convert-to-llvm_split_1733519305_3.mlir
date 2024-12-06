module {
  func.func @subview_non_zero_addrspace(%arg0: memref<64x4xf32, strided<[4, 1]>, 3>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>, 3> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>, 3> to memref<?x?xf32, strided<[?, ?], offset: ?>, 3>
    return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>, 3>
  }
}