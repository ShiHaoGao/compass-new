memref.global "private" @A : memref<3x5xf16> = dense<-65504.0>

func.func private @printMemrefF16(memref<*xf16>) attributes { llvm.emit_c_interface }

func.func @buddy_softmax_f16(){
  %a = memref.get_global @A : memref<3x5xf16>
  %b = memref.alloc() : memref<3x5xf16>

  linalg.softmax 
      dimension (1)
      ins(%a: memref<3x5xf16>)
      outs(%b: memref<3x5xf16>)
  %printed_b = memref.cast %b : memref<3x5xf16> to memref<*xf16>
  call @printMemrefF16(%printed_b) : (memref<*xf16>) -> ()

  return
}