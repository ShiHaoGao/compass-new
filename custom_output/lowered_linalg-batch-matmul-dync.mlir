module {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @printMemrefF32(i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @buddy_batchmatmul_f32(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.insertvalue %arg18, %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.insertvalue %arg19, %1[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.insertvalue %arg20, %2[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %4 = llvm.insertvalue %arg21, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.insertvalue %arg24, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %6 = llvm.insertvalue %arg22, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.insertvalue %arg25, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %8 = llvm.insertvalue %arg23, %7[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.insertvalue %arg26, %8[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %10 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %11 = llvm.insertvalue %arg9, %10[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %12 = llvm.insertvalue %arg10, %11[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.insertvalue %arg11, %12[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %14 = llvm.insertvalue %arg12, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.insertvalue %arg15, %14[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %16 = llvm.insertvalue %arg13, %15[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.insertvalue %arg16, %16[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %18 = llvm.insertvalue %arg14, %17[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %19 = llvm.insertvalue %arg17, %18[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %21 = llvm.insertvalue %arg0, %20[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %22 = llvm.insertvalue %arg1, %21[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %23 = llvm.insertvalue %arg2, %22[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %24 = llvm.insertvalue %arg3, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %25 = llvm.insertvalue %arg6, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %26 = llvm.insertvalue %arg4, %25[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %27 = llvm.insertvalue %arg7, %26[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %28 = llvm.insertvalue %arg5, %27[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %29 = llvm.insertvalue %arg8, %28[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %30 = llvm.mlir.constant(2 : index) : i64
    %31 = llvm.mlir.constant(1 : index) : i64
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.mlir.constant(1 : index) : i64
    %34 = llvm.extractvalue %29[3] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %35 = llvm.alloca %33 x !llvm.array<3 x i64> : (i64) -> !llvm.ptr
    llvm.store %34, %35 : !llvm.array<3 x i64>, !llvm.ptr
    %36 = llvm.getelementptr %35[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<3 x i64>
    %37 = llvm.load %36 : !llvm.ptr -> i64
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.extractvalue %29[3] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %40 = llvm.alloca %38 x !llvm.array<3 x i64> : (i64) -> !llvm.ptr
    llvm.store %39, %40 : !llvm.array<3 x i64>, !llvm.ptr
    %41 = llvm.getelementptr %40[0, %31] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<3 x i64>
    %42 = llvm.load %41 : !llvm.ptr -> i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.extractvalue %29[3] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %45 = llvm.alloca %43 x !llvm.array<3 x i64> : (i64) -> !llvm.ptr
    llvm.store %44, %45 : !llvm.array<3 x i64>, !llvm.ptr
    %46 = llvm.getelementptr %45[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<3 x i64>
    %47 = llvm.load %46 : !llvm.ptr -> i64
    %48 = llvm.mlir.constant(1 : index) : i64
    %49 = llvm.extractvalue %19[3] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %50 = llvm.alloca %48 x !llvm.array<3 x i64> : (i64) -> !llvm.ptr
    llvm.store %49, %50 : !llvm.array<3 x i64>, !llvm.ptr
    %51 = llvm.getelementptr %50[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<3 x i64>
    %52 = llvm.load %51 : !llvm.ptr -> i64
    llvm.br ^bb1(%32 : i64)
  ^bb1(%53: i64):  // 2 preds: ^bb0, ^bb11
    %54 = llvm.icmp "slt" %53, %37 : i64
    llvm.cond_br %54, ^bb2, ^bb12
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%32 : i64)
  ^bb3(%55: i64):  // 2 preds: ^bb2, ^bb10
    %56 = llvm.icmp "slt" %55, %42 : i64
    llvm.cond_br %56, ^bb4, ^bb11
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%32 : i64)
  ^bb5(%57: i64):  // 2 preds: ^bb4, ^bb9
    %58 = llvm.icmp "slt" %57, %52 : i64
    llvm.cond_br %58, ^bb6, ^bb10
  ^bb6:  // pred: ^bb5
    llvm.br ^bb7(%32 : i64)
  ^bb7(%59: i64):  // 2 preds: ^bb6, ^bb8
    %60 = llvm.icmp "slt" %59, %47 : i64
    llvm.cond_br %60, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %61 = llvm.extractvalue %29[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %62 = llvm.extractvalue %29[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %63 = llvm.mul %53, %62 : i64
    %64 = llvm.extractvalue %29[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %65 = llvm.mul %55, %64 : i64
    %66 = llvm.add %63, %65 : i64
    %67 = llvm.add %66, %59 : i64
    %68 = llvm.getelementptr %61[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %69 = llvm.load %68 : !llvm.ptr -> f32
    %70 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %71 = llvm.extractvalue %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %72 = llvm.mul %53, %71 : i64
    %73 = llvm.extractvalue %19[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %74 = llvm.mul %59, %73 : i64
    %75 = llvm.add %72, %74 : i64
    %76 = llvm.add %75, %57 : i64
    %77 = llvm.getelementptr %70[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %78 = llvm.load %77 : !llvm.ptr -> f32
    %79 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %80 = llvm.extractvalue %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %81 = llvm.mul %53, %80 : i64
    %82 = llvm.extractvalue %9[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %83 = llvm.mul %55, %82 : i64
    %84 = llvm.add %81, %83 : i64
    %85 = llvm.add %84, %57 : i64
    %86 = llvm.getelementptr %79[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %87 = llvm.load %86 : !llvm.ptr -> f32
    %88 = llvm.fmul %69, %78  : f32
    %89 = llvm.fadd %87, %88  : f32
    %90 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %91 = llvm.extractvalue %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %92 = llvm.mul %53, %91 : i64
    %93 = llvm.extractvalue %9[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %94 = llvm.mul %55, %93 : i64
    %95 = llvm.add %92, %94 : i64
    %96 = llvm.add %95, %57 : i64
    %97 = llvm.getelementptr %90[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %89, %97 : f32, !llvm.ptr
    %98 = llvm.add %59, %31 : i64
    llvm.br ^bb7(%98 : i64)
  ^bb9:  // pred: ^bb7
    %99 = llvm.add %57, %31 : i64
    llvm.br ^bb5(%99 : i64)
  ^bb10:  // pred: ^bb5
    %100 = llvm.add %55, %31 : i64
    llvm.br ^bb3(%100 : i64)
  ^bb11:  // pred: ^bb3
    %101 = llvm.add %53, %31 : i64
    llvm.br ^bb1(%101 : i64)
  ^bb12:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(3 : index) : i64
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %6 = llvm.mlir.constant(2.000000e+00 : f32) : f32
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mul %4, %2 : i64
    %10 = llvm.mul %9, %2 : i64
    %11 = llvm.mlir.zero : !llvm.ptr
    %12 = llvm.getelementptr %11[%10] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %13 = llvm.ptrtoint %12 : !llvm.ptr to i64
    %14 = llvm.call @malloc(%13) : (i64) -> !llvm.ptr
    %15 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %16 = llvm.insertvalue %14, %15[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.insertvalue %14, %16[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.insertvalue %18, %17[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.insertvalue %2, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %21 = llvm.insertvalue %2, %20[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %22 = llvm.insertvalue %4, %21[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %23 = llvm.insertvalue %9, %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %24 = llvm.insertvalue %4, %23[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %25 = llvm.insertvalue %8, %24[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.mul %3, %4 : i64
    %28 = llvm.mul %27, %2 : i64
    %29 = llvm.mlir.zero : !llvm.ptr
    %30 = llvm.getelementptr %29[%28] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %31 = llvm.ptrtoint %30 : !llvm.ptr to i64
    %32 = llvm.call @malloc(%31) : (i64) -> !llvm.ptr
    %33 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %34 = llvm.insertvalue %32, %33[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %35 = llvm.insertvalue %32, %34[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %36 = llvm.mlir.constant(0 : index) : i64
    %37 = llvm.insertvalue %36, %35[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %38 = llvm.insertvalue %2, %37[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %39 = llvm.insertvalue %4, %38[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %40 = llvm.insertvalue %3, %39[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %41 = llvm.insertvalue %27, %40[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %42 = llvm.insertvalue %3, %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %43 = llvm.insertvalue %26, %42[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %44 = llvm.mlir.constant(1 : index) : i64
    %45 = llvm.mul %3, %2 : i64
    %46 = llvm.mul %45, %2 : i64
    %47 = llvm.mlir.zero : !llvm.ptr
    %48 = llvm.getelementptr %47[%46] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.ptrtoint %48 : !llvm.ptr to i64
    %50 = llvm.call @malloc(%49) : (i64) -> !llvm.ptr
    %51 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %52 = llvm.insertvalue %50, %51[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %53 = llvm.insertvalue %50, %52[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %54 = llvm.mlir.constant(0 : index) : i64
    %55 = llvm.insertvalue %54, %53[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %56 = llvm.insertvalue %2, %55[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %57 = llvm.insertvalue %2, %56[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %58 = llvm.insertvalue %3, %57[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %59 = llvm.insertvalue %45, %58[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %60 = llvm.insertvalue %3, %59[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %61 = llvm.insertvalue %44, %60[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.br ^bb1(%1 : i64)
  ^bb1(%62: i64):  // 2 preds: ^bb0, ^bb8
    %63 = llvm.icmp "slt" %62, %2 : i64
    llvm.cond_br %63, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%1 : i64)
  ^bb3(%64: i64):  // 2 preds: ^bb2, ^bb7
    %65 = llvm.icmp "slt" %64, %2 : i64
    llvm.cond_br %65, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%1 : i64)
  ^bb5(%66: i64):  // 2 preds: ^bb4, ^bb6
    %67 = llvm.icmp "slt" %66, %4 : i64
    llvm.cond_br %67, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %68 = llvm.extractvalue %25[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %69 = llvm.extractvalue %25[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %70 = llvm.mul %62, %69 : i64
    %71 = llvm.extractvalue %25[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %72 = llvm.mul %64, %71 : i64
    %73 = llvm.add %70, %72 : i64
    %74 = llvm.add %73, %66 : i64
    %75 = llvm.getelementptr %68[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %5, %75 : f32, !llvm.ptr
    %76 = llvm.add %66, %0 : i64
    llvm.br ^bb5(%76 : i64)
  ^bb7:  // pred: ^bb5
    %77 = llvm.add %64, %0 : i64
    llvm.br ^bb3(%77 : i64)
  ^bb8:  // pred: ^bb3
    %78 = llvm.add %62, %0 : i64
    llvm.br ^bb1(%78 : i64)
  ^bb9:  // pred: ^bb1
    llvm.br ^bb10(%1 : i64)
  ^bb10(%79: i64):  // 2 preds: ^bb9, ^bb17
    %80 = llvm.icmp "slt" %79, %2 : i64
    llvm.cond_br %80, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12(%1 : i64)
  ^bb12(%81: i64):  // 2 preds: ^bb11, ^bb16
    %82 = llvm.icmp "slt" %81, %4 : i64
    llvm.cond_br %82, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    llvm.br ^bb14(%1 : i64)
  ^bb14(%83: i64):  // 2 preds: ^bb13, ^bb15
    %84 = llvm.icmp "slt" %83, %3 : i64
    llvm.cond_br %84, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %85 = llvm.extractvalue %43[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %86 = llvm.extractvalue %43[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %87 = llvm.mul %79, %86 : i64
    %88 = llvm.extractvalue %43[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %89 = llvm.mul %81, %88 : i64
    %90 = llvm.add %87, %89 : i64
    %91 = llvm.add %90, %83 : i64
    %92 = llvm.getelementptr %85[%91] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %6, %92 : f32, !llvm.ptr
    %93 = llvm.add %83, %0 : i64
    llvm.br ^bb14(%93 : i64)
  ^bb16:  // pred: ^bb14
    %94 = llvm.add %81, %0 : i64
    llvm.br ^bb12(%94 : i64)
  ^bb17:  // pred: ^bb12
    %95 = llvm.add %79, %0 : i64
    llvm.br ^bb10(%95 : i64)
  ^bb18:  // pred: ^bb10
    llvm.br ^bb19(%1 : i64)
  ^bb19(%96: i64):  // 2 preds: ^bb18, ^bb26
    %97 = llvm.icmp "slt" %96, %2 : i64
    llvm.cond_br %97, ^bb20, ^bb27
  ^bb20:  // pred: ^bb19
    llvm.br ^bb21(%1 : i64)
  ^bb21(%98: i64):  // 2 preds: ^bb20, ^bb25
    %99 = llvm.icmp "slt" %98, %2 : i64
    llvm.cond_br %99, ^bb22, ^bb26
  ^bb22:  // pred: ^bb21
    llvm.br ^bb23(%1 : i64)
  ^bb23(%100: i64):  // 2 preds: ^bb22, ^bb24
    %101 = llvm.icmp "slt" %100, %3 : i64
    llvm.cond_br %101, ^bb24, ^bb25
  ^bb24:  // pred: ^bb23
    %102 = llvm.extractvalue %61[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %103 = llvm.extractvalue %61[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %104 = llvm.mul %96, %103 : i64
    %105 = llvm.extractvalue %61[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %106 = llvm.mul %98, %105 : i64
    %107 = llvm.add %104, %106 : i64
    %108 = llvm.add %107, %100 : i64
    %109 = llvm.getelementptr %102[%108] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %109 : f32, !llvm.ptr
    %110 = llvm.add %100, %0 : i64
    llvm.br ^bb23(%110 : i64)
  ^bb25:  // pred: ^bb23
    %111 = llvm.add %98, %0 : i64
    llvm.br ^bb21(%111 : i64)
  ^bb26:  // pred: ^bb21
    %112 = llvm.add %96, %0 : i64
    llvm.br ^bb19(%112 : i64)
  ^bb27:  // pred: ^bb19
    %113 = llvm.extractvalue %25[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %114 = llvm.extractvalue %25[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %115 = llvm.extractvalue %25[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %116 = llvm.extractvalue %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %117 = llvm.extractvalue %25[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %118 = llvm.extractvalue %25[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %119 = llvm.extractvalue %25[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %120 = llvm.extractvalue %25[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %121 = llvm.extractvalue %25[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %122 = llvm.extractvalue %43[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %123 = llvm.extractvalue %43[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %124 = llvm.extractvalue %43[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %125 = llvm.extractvalue %43[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %126 = llvm.extractvalue %43[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %127 = llvm.extractvalue %43[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %128 = llvm.extractvalue %43[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %129 = llvm.extractvalue %43[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %130 = llvm.extractvalue %43[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %131 = llvm.extractvalue %61[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %132 = llvm.extractvalue %61[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %133 = llvm.extractvalue %61[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %134 = llvm.extractvalue %61[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %135 = llvm.extractvalue %61[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %136 = llvm.extractvalue %61[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %137 = llvm.extractvalue %61[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %138 = llvm.extractvalue %61[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %139 = llvm.extractvalue %61[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.call @buddy_batchmatmul_f32(%113, %114, %115, %116, %117, %118, %119, %120, %121, %122, %123, %124, %125, %126, %127, %128, %129, %130, %131, %132, %133, %134, %135, %136, %137, %138, %139) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64) -> ()
    %140 = llvm.mlir.constant(1 : index) : i64
    %141 = llvm.alloca %140 x !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %61, %141 : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, !llvm.ptr
    %142 = llvm.mlir.constant(3 : index) : i64
    %143 = llvm.mlir.undef : !llvm.struct<(i64, ptr)>
    %144 = llvm.insertvalue %142, %143[0] : !llvm.struct<(i64, ptr)> 
    %145 = llvm.insertvalue %141, %144[1] : !llvm.struct<(i64, ptr)> 
    %146 = llvm.extractvalue %145[0] : !llvm.struct<(i64, ptr)> 
    %147 = llvm.extractvalue %145[1] : !llvm.struct<(i64, ptr)> 
    llvm.call @printMemrefF32(%146, %147) : (i64, !llvm.ptr) -> ()
    %148 = llvm.extractvalue %61[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.call @free(%148) : (!llvm.ptr) -> ()
    %149 = llvm.extractvalue %43[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.call @free(%149) : (!llvm.ptr) -> ()
    %150 = llvm.extractvalue %25[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.call @free(%150) : (!llvm.ptr) -> ()
    llvm.return
  }
}

