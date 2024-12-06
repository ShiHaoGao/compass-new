module {
  func.func @apply_scale_test_i48(%arg0: i48, %arg1: i32, %arg2: i8) -> i32 {
    %0 = tosa.apply_scale %arg0, %arg1, %arg2 {double_round = true} : (i48, i32, i8) -> i32
    return %0 : i32
  }
}