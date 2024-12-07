module {
  memref.global @gv0 : memref<2xf32> = uninitialized
  memref.global "private" @gv1 : memref<2xf32>
  memref.global @gv2 : memref<2x3xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]>
  func.func @get_gv0_memref() {
    %0 = memref.get_global @gv0 : memref<2xf32>
    return
  }
  func.func @get_gv2_memref() {
    %0 = memref.get_global @gv2 : memref<2x3xf32>
    return
  }
  memref.global @gv3 : memref<f32> = dense<1.000000e+00>
  func.func @get_gv3_memref() {
    %0 = memref.get_global @gv3 : memref<f32>
    return
  }
  memref.global "private" @gv4 : memref<f32> = dense<1.000000e+00> {alignment = 64 : i64}
}