module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (i64)>)
  func.func private @merge_on_conversion(!llvm.struct<"foo", (index)>)
}