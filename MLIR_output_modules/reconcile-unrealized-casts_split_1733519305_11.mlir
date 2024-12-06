module {
  func.func @liveBifurcation(%arg0: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg0 : i64 to i32
    %1 = builtin.unrealized_conversion_cast %0 : i32 to i64
    %2 = builtin.unrealized_conversion_cast %0 : i32 to i1
    %3 = arith.extsi %2 : i1 to i64
    %4 = arith.addi %1, %3 : i64
    return %4 : i64
  }
}