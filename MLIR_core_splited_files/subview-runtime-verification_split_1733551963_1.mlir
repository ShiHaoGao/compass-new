module {
  func.func @subview(%arg0: memref<1xf32>, %arg1: index) {
    %subview = memref.subview %arg0[%arg1] [1] [1] : memref<1xf32> to memref<1xf32, strided<[1], offset: ?>>
    return
  }
  func.func @subview_dynamic(%arg0: memref<?x4xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %subview = memref.subview %arg0[%arg1, 0] [%arg2, 4] [%arg3, 1] : memref<?x4xf32> to memref<?x4xf32, strided<[?, 1], offset: ?>>
    return
  }
  func.func @subview_dynamic_rank_reduce(%arg0: memref<?x4xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %subview = memref.subview %arg0[%arg1, 0] [%arg2, 1] [%arg3, 1] : memref<?x4xf32> to memref<?xf32, strided<[?], offset: ?>>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %alloca = memref.alloca() : memref<1xf32>
    %alloca_0 = memref.alloca() : memref<4x4xf32>
    %cast = memref.cast %alloca_0 : memref<4x4xf32> to memref<?x4xf32>
    call @subview_dynamic_rank_reduce(%cast, %c5, %c5, %c1) : (memref<?x4xf32>, index, index, index) -> ()
    call @subview(%alloca, %c1) : (memref<1xf32>, index) -> ()
    call @subview(%alloca, %c-1) : (memref<1xf32>, index) -> ()
    call @subview_dynamic(%cast, %c0, %c5, %c1) : (memref<?x4xf32>, index, index, index) -> ()
    call @subview_dynamic(%cast, %c0, %c4, %c4) : (memref<?x4xf32>, index, index, index) -> ()
    call @subview(%alloca, %c0) : (memref<1xf32>, index) -> ()
    call @subview_dynamic(%cast, %c0, %c4, %c1) : (memref<?x4xf32>, index, index, index) -> ()
    call @subview_dynamic_rank_reduce(%cast, %c0, %c1, %c0) : (memref<?x4xf32>, index, index, index) -> ()
    return
  }
}