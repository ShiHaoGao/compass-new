module {
  memref.global "private" constant @__constant_2x2xf32 : memref<2x2xf32> = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> {alignment = 64 : i64}
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = memref.get_global @__constant_2x2xf32 : memref<2x2xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x2xf32>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        %2 = memref.load %0[%arg0, %arg1] : memref<2x2xf32>
        %3 = arith.negf %2 : f32
        %4 = math.exp %3 : f32
        %5 = arith.addf %4, %cst : f32
        %6 = arith.divf %cst, %5 : f32
        memref.store %6, %alloc[%arg0, %arg1] : memref<2x2xf32>
      }
    }
    %cast = memref.cast %alloc : memref<2x2xf32> to memref<*xf32>
    %1 = bufferization.to_tensor %cast : memref<*xf32>
    call @printMemrefF32(%1) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

