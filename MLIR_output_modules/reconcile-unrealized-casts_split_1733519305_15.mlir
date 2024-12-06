module {
  func.func @emptyCast() -> index {
    %0 = builtin.unrealized_conversion_cast to index
    return %0 : index
  }
}