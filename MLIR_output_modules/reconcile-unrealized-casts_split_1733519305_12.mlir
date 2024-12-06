module {
  func.func @deadNToOneCast(%arg0: index, %arg1: index) {
    %0 = builtin.unrealized_conversion_cast %arg0, %arg1 : index, index to i64
    return
  }
}