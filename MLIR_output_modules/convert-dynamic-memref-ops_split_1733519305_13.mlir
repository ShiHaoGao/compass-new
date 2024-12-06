module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<3xi64>, !llvm.ptr<1> = dense<32> : vector<3xi64>>} {
  func.func @memref_memory_space_cast(%arg0: memref<*xf32>) -> memref<*xf32, 1> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<*xf32> to memref<*xf32, 1>
    return %memspacecast : memref<*xf32, 1>
  }
}