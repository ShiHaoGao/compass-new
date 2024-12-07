module {
  func.func @reinterpret_cast(%arg0: memref<1xf32>, %arg1: index) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [1], strides: [1] : memref<1xf32> to memref<1xf32, strided<[1], offset: ?>>
    return
  }
  func.func @reinterpret_cast_fully_dynamic(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [%arg2], strides: [%arg3] : memref<?xf32> to memref<?xf32, strided<[?], offset: ?>>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %alloca = memref.alloca() : memref<1xf32>
    %alloca_0 = memref.alloca() : memref<4xf32>
    %cast = memref.cast %alloca_0 : memref<4xf32> to memref<?xf32>
    call @reinterpret_cast(%alloca, %c1) : (memref<1xf32>, index) -> ()
    call @reinterpret_cast(%alloca, %c-1) : (memref<1xf32>, index) -> ()
    call @reinterpret_cast_fully_dynamic(%cast, %c0, %c5, %c1) : (memref<?xf32>, index, index, index) -> ()
    call @reinterpret_cast_fully_dynamic(%cast, %c0, %c4, %c4) : (memref<?xf32>, index, index, index) -> ()
    call @reinterpret_cast(%alloca, %c0) : (memref<1xf32>, index) -> ()
    call @reinterpret_cast_fully_dynamic(%cast, %c0, %c4, %c1) : (memref<?xf32>, index, index, index) -> ()
    return
  }
}