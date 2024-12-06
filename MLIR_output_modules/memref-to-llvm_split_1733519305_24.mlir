module {
  func.func @extract_strided_metadata(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>) {
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>> -> memref<f32>, index, index, index, index, index
    return
  }
}