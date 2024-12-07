#map = affine_map<(d0, d1, d2, d3) -> (d0, 0, 0, d3)>
module {
  func.func @cannot_lower_transfer_read_with_leading_scalable(%arg0: memref<?x4xf32>) -> vector<[4]x4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?x4xf32>
    %0 = vector.create_mask %dim, %c4 : vector<[4]x4xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<?x4xf32>, vector<[4]x4xf32>
    return %1 : vector<[4]x4xf32>
  }
  func.func @does_not_crash_on_unpack_one_dim(%arg0: memref<1x1x1x1xi32>, %arg1: vector<1x1xi1>) -> vector<1x1x1x1xi32> {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i32, %arg1 {permutation_map = #map} : memref<1x1x1x1xi32>, vector<1x1x1x1xi32>
    return %0 : vector<1x1x1x1xi32>
  }
  func.func @add_arrays_of_scalable_vectors(%arg0: memref<1x2x?xf32>, %arg1: memref<1x2x?xf32>) -> vector<1x2x[4]xf32> {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c2_0 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c2 : memref<1x2x?xf32>
    %0 = vector.create_mask %c2, %c2_0, %dim : vector<1x2x[4]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst, %0 {in_bounds = [true, true, true]} : memref<1x2x?xf32>, vector<1x2x[4]xf32>
    return %1 : vector<1x2x[4]xf32>
  }
  func.func @cannot_fully_unroll_transfer_write_of_nd_scalable_vector(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @unroll_transfer_write_target_rank_zero(%arg0: vector<2xi32>) {
    %alloc = memref.alloc() : memref<4xi32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %alloc[%c0] : vector<2xi32>, memref<4xi32>
    return
  }
}