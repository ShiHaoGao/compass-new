module {
  func.func @extract_aligned_pointer_as_index_unranked(%arg0: memref<*xf32>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<*xf32> -> index
    return %intptr : index
  }
}