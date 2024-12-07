module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, i64)>)
  func.func private @merge_on_conversion_recursive(!llvm.struct<"foo", (!llvm.struct<"foo">, index)>)
}