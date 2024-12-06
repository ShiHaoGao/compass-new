module {
  func.func @pair(%arg0: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i32
    %1 = builtin.unrealized_conversion_cast %0 : i32 to i64
    return %1 : i64
  }
}