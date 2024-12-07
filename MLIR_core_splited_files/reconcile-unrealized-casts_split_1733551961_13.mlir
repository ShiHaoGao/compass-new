module {
  func.func @swappingOperands(%arg0: index, %arg1: index) -> (index, index) {
    %0:2 = builtin.unrealized_conversion_cast %arg0, %arg1 : index, index to i64, i64
    %1:2 = builtin.unrealized_conversion_cast %0#1, %0#0 : i64, i64 to i32, i32
    %2:2 = builtin.unrealized_conversion_cast %1#0, %1#1 : i32, i32 to index, index
    return %2#0, %2#1 : index, index
  }
}