module {
  func.func @loop_carried(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<64xi32, 201>, %arg4: memref<64xi32, 201>) -> (memref<64xi32, 201>, memref<64xi32, 201>) {
    cf.br ^bb1(%arg0, %arg3, %arg4 : index, memref<64xi32, 201>, memref<64xi32, 201>)
  ^bb1(%0: index, %1: memref<64xi32, 201>, %2: memref<64xi32, 201>):  // 2 preds: ^bb0, ^bb2
    %3 = arith.cmpi slt, %0, %arg1 : index
    cf.cond_br %3, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %4 = arith.addi %0, %arg2 : index
    cf.br ^bb1(%4, %2, %1 : index, memref<64xi32, 201>, memref<64xi32, 201>)
  ^bb3:  // pred: ^bb1
    return %1, %2 : memref<64xi32, 201>, memref<64xi32, 201>
  }
}