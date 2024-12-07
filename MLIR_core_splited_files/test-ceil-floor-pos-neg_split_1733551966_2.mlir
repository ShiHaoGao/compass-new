module {
  func.func @non_inline_function() -> (i64, i64, i64, i64, i64, i64) {
    %c-9223372036854775807_i64 = arith.constant -9223372036854775807 : i64
    %c-1_i64 = arith.constant -1 : i64
    %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
    %c1_i64 = arith.constant 1 : i64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    return %c-9223372036854775807_i64, %c-1_i64, %c-9223372036854775808_i64, %c1_i64, %c9223372036854775807_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64
  }
  func.func @main() {
    %0:6 = call @non_inline_function() : () -> (i64, i64, i64, i64, i64, i64)
    %1 = arith.floordivsi %0#0, %0#1 : i64
    %2 = arith.floordivsi %0#2, %0#3 : i64
    %3 = arith.floordivsi %0#4, %0#5 : i64
    vector.print %1 : i64
    vector.print %2 : i64
    vector.print %3 : i64
    return
  }
}