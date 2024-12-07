module {
  func.func @apply_scale_test_i64(%arg0: i64, %arg1: i32, %arg2: i8) -> i32 {
    %0 = tosa.apply_scale %arg0, %arg1, %arg2 {double_round = true} : (i64, i32, i8) -> i32
    return %0 : i32
  }
}