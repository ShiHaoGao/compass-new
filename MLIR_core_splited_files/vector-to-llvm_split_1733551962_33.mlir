module {
  func.func @masked_int_or_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<or>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @masked_int_or_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<or>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}