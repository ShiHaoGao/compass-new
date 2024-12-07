module {
  func.func @rank_of_unranked(%arg0: memref<*xi32>) {
    %0 = memref.rank %arg0 : memref<*xi32>
    return
  }
  func.func @rank_of_ranked(%arg0: memref<?xi32>) {
    %0 = memref.rank %arg0 : memref<?xi32>
    return
  }
}