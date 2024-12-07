#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0)[s0] -> (d0, -d0 + s0)>
#map2 = affine_map<(d0)[s0] -> (s0, d0 + 10)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4, d5, d6)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<()[s0] -> (s0)>
#map6 = affine_map<(d0)[s0] -> (d0 + s0 + 1)>
#map7 = affine_map<(d0, d1, d2, d3)[s0, s1, s2] -> (d0 + d1 * 2 + d2 * 3 + d3 * 4 + s0 * 5 + s1 * 6 + s2 * 7)>
#set = affine_set<(d0) : (-d0 + 20 >= 0)>
#set1 = affine_set<(d0) : (d0 - 10 >= 0)>
#set2 = affine_set<(d0)[s0, s1, s2, s3] : (-d0 + s0 + 1 >= 0, s0 - 1 >= 0, s1 - 1 >= 0, s2 - 1 >= 0, s3 - 42 == 0)>
module {
  func.func @empty() {
    return
  }
  func.func private @body(index)
  func.func @simple_loop() {
    affine.for %arg0 = 1 to 42 {
      func.call @body(%arg0) : (index) -> ()
    }
    return
  }
  func.func @for_with_yield(%arg0: memref<1024xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg1 = 0 to 10 step 2 iter_args(%arg2 = %cst) -> (f32) {
      %1 = affine.load %arg0[%arg1] : memref<1024xf32>
      %2 = arith.addf %arg2, %1 : f32
      affine.yield %2 : f32
    }
    return %0 : f32
  }
  func.func private @pre(index)
  func.func private @body2(index, index)
  func.func private @post(index)
  func.func @imperfectly_nested_loops() {
    affine.for %arg0 = 0 to 42 {
      func.call @pre(%arg0) : (index) -> ()
      affine.for %arg1 = 7 to 56 step 2 {
        func.call @body2(%arg0, %arg1) : (index, index) -> ()
      }
      func.call @post(%arg0) : (index) -> ()
    }
    return
  }
  func.func private @mid(index)
  func.func private @body3(index, index)
  func.func @more_imperfectly_nested_loops() {
    affine.for %arg0 = 0 to 42 {
      func.call @pre(%arg0) : (index) -> ()
      affine.for %arg1 = 7 to 56 step 2 {
        func.call @body2(%arg0, %arg1) : (index, index) -> ()
      }
      func.call @mid(%arg0) : (index) -> ()
      affine.for %arg1 = 18 to 37 step 3 {
        func.call @body3(%arg0, %arg1) : (index, index) -> ()
      }
      func.call @post(%arg0) : (index) -> ()
    }
    return
  }
  func.func @affine_apply_loops_shorthand(%arg0: index) {
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = #map(%arg1) to 42 {
        func.call @body2(%arg1, %arg2) : (index, index) -> ()
      }
    }
    return
  }
  func.func private @get_idx() -> index
  func.func @if_only() {
    %0 = call @get_idx() : () -> index
    affine.if #set(%0) {
      func.call @body(%0) : (index) -> ()
    }
    return
  }
  func.func @if_else() {
    %0 = call @get_idx() : () -> index
    affine.if #set(%0) {
      func.call @body(%0) : (index) -> ()
    } else {
      func.call @mid(%0) : (index) -> ()
    }
    return
  }
  func.func @nested_ifs() {
    %0 = call @get_idx() : () -> index
    affine.if #set(%0) {
      affine.if #set1(%0) {
        func.call @body(%0) : (index) -> ()
      }
    } else {
      affine.if #set1(%0) {
        func.call @mid(%0) : (index) -> ()
      }
    }
    return
  }
  func.func @if_with_yield() -> i64 {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %0 = call @get_idx() : () -> index
    %1 = affine.if #set1(%0) -> i64 {
      affine.yield %c0_i64 : i64
    } else {
      affine.yield %c1_i64 : i64
    }
    return %1 : i64
  }
  func.func @multi_cond(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %0 = call @get_idx() : () -> index
    affine.if #set2(%0)[%arg0, %arg1, %arg2, %arg3] {
      func.call @body(%0) : (index) -> ()
    } else {
      func.call @mid(%0) : (index) -> ()
    }
    return
  }
  func.func @if_for() {
    %0 = call @get_idx() : () -> index
    affine.if #set(%0) {
      affine.for %arg0 = 0 to 42 {
        affine.if #set1(%arg0) {
          func.call @body2(%0, %arg0) : (index, index) -> ()
        }
      }
    }
    affine.for %arg0 = 0 to 42 {
      affine.if #set1(%arg0) {
        affine.for %arg1 = 0 to 42 {
          func.call @body3(%arg0, %arg1) : (index, index) -> ()
        }
      }
    }
    return
  }
  func.func @loop_min_max(%arg0: index) {
    affine.for %arg1 = 0 to 42 {
      affine.for %arg2 = max #map1(%arg1)[%arg0] to min #map2(%arg1)[%arg0] {
        func.call @body2(%arg1, %arg2) : (index, index) -> ()
      }
    }
    return
  }
  func.func @min_reduction_tree(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) {
    affine.for %arg7 = 0 to min #map3(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) {
      func.call @body(%arg7) : (index) -> ()
    }
    return
  }
  func.func @affine_applies(%arg0: index) {
    %0 = affine.apply #map4()
    %c101 = arith.constant 101 : index
    %1 = affine.apply #map5()[%0]
    %c102 = arith.constant 102 : index
    %2 = affine.apply #map(%0)
    %3 = affine.apply #map6(%1)[%0]
    %4 = affine.apply #map7(%arg0, %arg0, %arg0, %arg0)[%arg0, %arg0, %arg0]
    return
  }
  func.func @args_ret_affine_apply(%arg0: index, %arg1: index) -> (index, index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map5()[%arg1]
    return %0, %1 : index, index
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
