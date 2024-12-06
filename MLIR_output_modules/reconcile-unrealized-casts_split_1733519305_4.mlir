module {
  func.func @symmetricChain(%arg0: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i32
    %1 = builtin.unrealized_conversion_cast %0 : i32 to i1
    %2 = builtin.unrealized_conversion_cast %1 : i1 to i32
    %3 = builtin.unrealized_conversion_cast %2 : i32 to i64
    return %3 : i64
  }
}