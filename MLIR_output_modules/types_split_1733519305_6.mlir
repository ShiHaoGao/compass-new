module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", packed (struct<"_Converted.foo">, i64)>)
  func.func private @merge_on_conversion_pack(!llvm.struct<"foo", packed (!llvm.struct<"foo">, index)>)
}