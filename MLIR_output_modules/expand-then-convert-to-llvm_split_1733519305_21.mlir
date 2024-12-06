module {
  func.func @load_and_assume(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) -> f32 {
    memref.assume_alignment %arg0, 16 : memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = memref.load %arg0[%arg1, %arg2] : memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %0 : f32
  }
}