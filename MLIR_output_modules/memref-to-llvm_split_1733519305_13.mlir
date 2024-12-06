module {
  func.func @atomic_rmw(%arg0: memref<10xi32>, %arg1: i32, %arg2: memref<10xf32>, %arg3: f32, %arg4: index) {
    %0 = memref.atomic_rmw assign %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %1 = memref.atomic_rmw addi %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %2 = memref.atomic_rmw maxs %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %3 = memref.atomic_rmw mins %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %4 = memref.atomic_rmw maxu %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %5 = memref.atomic_rmw minu %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %6 = memref.atomic_rmw addf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %7 = memref.atomic_rmw ori %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %8 = memref.atomic_rmw andi %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    return
  }
}