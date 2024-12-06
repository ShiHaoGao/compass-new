module {
  func.func @view(%arg0: index, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<2048xi8>
    %view = memref.view %alloc[%arg2][%arg0, %arg1] : memref<2048xi8> to memref<?x?xf32>
    %view_0 = memref.view %alloc[%arg2][%arg1] : memref<2048xi8> to memref<4x?xf32>
    %view_1 = memref.view %alloc[%arg2][] : memref<2048xi8> to memref<64x4xf32>
    %alloc_2 = memref.alloc() : memref<2048xi8, 4>
    %view_3 = memref.view %alloc_2[%arg2][] : memref<2048xi8, 4> to memref<64x4xf32, 4>
    return
  }
}