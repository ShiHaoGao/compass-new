module {
  func.func @liveChain(%arg0: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i1
    %1 = builtin.unrealized_conversion_cast %0 : i1 to i32
    return %1 : i32
  }
}