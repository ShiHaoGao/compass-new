#loop_unroll = #llvm.loop_unroll<full = true>
#loop_unroll1 = #llvm.loop_unroll<disable = true>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll1>
module {
  func.func @simple_std_for_loops_annotation(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      scf.for %arg4 = %c0 to %c4 step %c1 {
        %c1_0 = arith.constant 1 : index
      } {llvm.loop_annotation = #loop_annotation}
    } {llvm.loop_annotation = #loop_annotation1}
    return
  }
}