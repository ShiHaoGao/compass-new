module {
  func.func @const_size() -> index {
    %c42 = shape.const_size 42
    %0 = shape.size_to_index %c42 : !shape.size
    return %0 : index
  }
}