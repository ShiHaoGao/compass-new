module {
  func.func @transfer_read_2d(%arg0: memref<40xi32>, %arg1: index) {
    %c-42_i32 = arith.constant -42 : i32
    %0 = vector.transfer_read %arg0[%arg1], %c-42_i32 : memref<40xi32>, vector<40xi32>
    vector.print %0 : vector<40xi32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c20_i32 = arith.constant 20 : i32
    %c10_i32 = arith.constant 10 : i32
    %c-10_i32 = arith.constant -10 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %alloc = memref.alloc() : memref<40xi32>
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      memref.store %1, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivsi %1, %c10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.floordivsi %1, %c10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivsi %1, %c-10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.floordivsi %1, %c-10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.ceildivui %0, %c10_i32 : i32
      memref.store %1, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivui %1, %c2147483647_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    memref.dealloc %alloc : memref<40xi32>
    return
  }
}