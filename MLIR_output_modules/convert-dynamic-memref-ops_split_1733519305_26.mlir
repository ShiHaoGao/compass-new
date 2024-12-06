module {
  func.func @memref_reinterpret_cast_unranked_to_dynamic_shape(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: memref<*xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%arg0], sizes: [%arg1, %arg2], strides: [%arg3, %arg4] : memref<*xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}