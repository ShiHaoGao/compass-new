module {
  func.func @binary_ops_on_size(%arg0: !shape.size, %arg1: !shape.size) {
    %0 = shape.add %arg0, %arg1 : !shape.size, !shape.size -> !shape.size
    %1 = shape.mul %arg0, %arg1 : !shape.size, !shape.size -> !shape.size
    return
  }
}