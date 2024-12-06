module {
  func.func @transfer_write_scalable(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %1 = llvm.intr.stepvector : vector<[16]xi32>
    %2 = arith.index_cast %dim : index to i32
    %3 = llvm.mlir.undef : vector<[16]xi32>
    %4 = llvm.insertelement %2, %3[%0 : i32] : vector<[16]xi32>
    %5 = llvm.shufflevector %4, %3 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] : vector<[16]xi32> 
    %6 = arith.cmpi slt, %1, %5 : vector<[16]xi32>
    %7 = llvm.mlir.undef : vector<[16]xf32>
    %8 = llvm.insertelement %arg1, %7[%0 : i32] : vector<[16]xf32>
    %9 = llvm.shufflevector %8, %7 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] : vector<[16]xf32> 
    vector.transfer_write %9, %arg0[%c0], %6 {in_bounds = [true]} : vector<[16]xf32>, memref<?xf32, strided<[?], offset: ?>>
    return
  }
}