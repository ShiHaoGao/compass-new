module {
  func.func @dim_of_unranked(%arg0: memref<*xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<*xi32>
    return %dim : index
  }
}