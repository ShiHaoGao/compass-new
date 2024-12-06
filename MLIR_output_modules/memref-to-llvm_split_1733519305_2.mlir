module {
  func.func @view_empty_memref(%arg0: index, %arg1: memref<0xi8>) {
    %view = memref.view %arg1[%arg0][] : memref<0xi8> to memref<0x4xf32>
    return
  }
}