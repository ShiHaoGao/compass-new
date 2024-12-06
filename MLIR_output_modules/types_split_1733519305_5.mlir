module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, i64)>)
  func.func private @create_clashing_pack(!llvm.struct<"foo", packed (!llvm.struct<"foo">, index)>)
}