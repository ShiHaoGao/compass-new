module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (f32)>)
  func.func private @create_clashes_on_conversion(!llvm.struct<"foo", (index)>)
}