module {
  func.func @sameTypes(%arg0: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i64
    return %0 : i64
  }
}