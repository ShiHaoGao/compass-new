module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, f32)>)
  func.func private @create_clashes_on_conversion_recursive(!llvm.struct<"foo", (!llvm.struct<"foo">, index)>)
}