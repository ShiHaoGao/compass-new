module {
  func.func @static_out_of_bound_memref_dim(%arg0: memref<42x32x15x13x27xf32>) -> index {
    %c-7 = arith.constant -7 : index
    %dim = memref.dim %arg0, %c-7 : memref<42x32x15x13x27xf32>
    return %dim : index
  }
}