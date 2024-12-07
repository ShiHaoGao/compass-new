module {
  func.func @atomic_rmw_with_offset(%arg0: memref<10xi32, strided<[1], offset: 5>>, %arg1: i32, %arg2: index) {
    %0 = memref.atomic_rmw andi %arg1, %arg0[%arg2] : (i32, memref<10xi32, strided<[1], offset: 5>>) -> i32
    return
  }
}