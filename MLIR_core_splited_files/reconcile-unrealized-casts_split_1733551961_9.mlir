module {
  func.func @liveSingleCast(%arg0: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i32
    return %0 : i32
  }
}