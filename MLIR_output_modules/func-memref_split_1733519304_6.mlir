module {
  func.func private @unsupported_memref_element_type() -> memref<42x!test.memref_element>
  func.func private @unsupported_unranked_memref_element_type() -> memref<*x!test.memref_element>
}