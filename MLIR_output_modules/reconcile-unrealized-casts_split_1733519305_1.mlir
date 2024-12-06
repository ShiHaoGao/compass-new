module {
  func.func @unusedCast(%arg0: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i32
    return %arg0 : i64
  }
}