module {
  func.func private @hoo(memref<*xi8>) -> memref<*xi8>
  func.func @check_unranked_memref_func_call(%arg0: memref<*xi8>) -> memref<*xi8> {
    %0 = call @hoo(%arg0) : (memref<*xi8>) -> memref<*xi8>
    return %0 : memref<*xi8>
  }
}