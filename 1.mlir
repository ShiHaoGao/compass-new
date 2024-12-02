module {
  memref.global "private" @gv : memref<4x4xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01], [3.000000e+01, 3.100000e+01, 3.200000e+01, 3.300000e+01]]>
  func.func @main() -> i32 {
    %cst = arith.constant dense<1.000000e+00> : vector<5xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<5xf32>
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c0_i32 = arith.constant 0 : i32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %alloca = memref.alloca() : memref<vector<4x4xf32>>
    %alloca_3 = memref.alloca() : memref<vector<3x2xf32>>
    %alloca_4 = memref.alloca() : memref<vector<5x5xf32>>
    %alloca_5 = memref.alloca() : memref<vector<5x5xf32>>
    %0 = memref.get_global @gv : memref<4x4xf32>
    %1 = vector.type_cast %alloca : memref<vector<4x4xf32>> to memref<4xvector<4xf32>>
    scf.for %arg0 = %c0 to %c4 step %c1 {
      %15 = vector.transfer_read %0[%arg0, %c0], %cst_2 {in_bounds = [true]} : memref<4x4xf32>, vector<4xf32>
      memref.store %15, %1[%arg0] : memref<4xvector<4xf32>>
    }
    %2 = memref.load %alloca[] : memref<vector<4x4xf32>>
    %3 = vector.transpose %2, [1, 0] : vector<4x4xf32> to vector<4x4xf32>
    %4 = vector.type_cast %alloca_3 : memref<vector<3x2xf32>> to memref<3xvector<2xf32>>
    scf.for %arg0 = %c0 to %c3 step %c1 {
      %c1_6 = arith.constant 1 : index
      %15 = arith.addi %arg0, %c1_6 : index
      %16 = vector.transfer_read %0[%15, %c1], %cst_2 {in_bounds = [true]} : memref<4x4xf32>, vector<2xf32>
      memref.store %16, %4[%arg0] : memref<3xvector<2xf32>>
    }
    %5 = memref.load %alloca_3[] : memref<vector<3x2xf32>>
    %6 = vector.transpose %5, [1, 0] : vector<3x2xf32> to vector<2x3xf32>
    %7 = vector.type_cast %alloca_4 : memref<vector<5x5xf32>> to memref<5xvector<5xf32>>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %15 = arith.cmpi slt, %arg0, %c4 : index
      scf.if %15 {
        %16 = vector.transfer_read %0[%arg0, %c0], %cst_2 : memref<4x4xf32>, vector<5xf32>
        memref.store %16, %7[%arg0] : memref<5xvector<5xf32>>
      } else {
        memref.store %cst_0, %7[%arg0] : memref<5xvector<5xf32>>
      }
    }
    %8 = memref.load %alloca_4[] : memref<vector<5x5xf32>>
    %9 = vector.type_cast %alloca_5 : memref<vector<5x5xf32>> to memref<5xvector<5xf32>>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %15 = arith.cmpi slt, %arg0, %c4 : index
      scf.if %15 {
        %16 = vector.transfer_read %0[%arg0, %c0], %cst_1 : memref<4x4xf32>, vector<5xf32>
        memref.store %16, %9[%arg0] : memref<5xvector<5xf32>>
      } else {
        memref.store %cst, %9[%arg0] : memref<5xvector<5xf32>>
      }
    }
    %10 = memref.load %alloca_5[] : memref<vector<5x5xf32>>
    %11 = vector.shape_cast %3 : vector<4x4xf32> to vector<16xf32>
    vector.print punctuation <open>
    scf.for %arg0 = %c0 to %c4 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %c4 step %c1 {
        %16 = arith.muli %arg0, %c4 : index
        %17 = arith.addi %arg1, %16 : index
        %18 = vector.extractelement %11[%17 : index] : vector<16xf32>
        vector.print %18 : f32 punctuation <no_punctuation>
        %19 = arith.cmpi ult, %arg1, %c3 : index
        scf.if %19 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      %15 = arith.cmpi ult, %arg0, %c3 : index
      scf.if %15 {
        vector.print punctuation <comma>
      }
    }
    vector.print punctuation <close>
    vector.print
    %12 = vector.shape_cast %6 : vector<2x3xf32> to vector<6xf32>
    vector.print punctuation <open>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %c3 step %c1 {
        %16 = arith.muli %arg0, %c3 : index
        %17 = arith.addi %arg1, %16 : index
        %18 = vector.extractelement %12[%17 : index] : vector<6xf32>
        vector.print %18 : f32 punctuation <no_punctuation>
        %19 = arith.cmpi ult, %arg1, %c2 : index
        scf.if %19 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      %15 = arith.cmpi ult, %arg0, %c1 : index
      scf.if %15 {
        vector.print punctuation <comma>
      }
    }
    vector.print punctuation <close>
    vector.print
    %13 = vector.shape_cast %8 : vector<5x5xf32> to vector<25xf32>
    vector.print punctuation <open>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %c5 step %c1 {
        %16 = arith.muli %arg0, %c5 : index
        %17 = arith.addi %arg1, %16 : index
        %18 = vector.extractelement %13[%17 : index] : vector<25xf32>
        vector.print %18 : f32 punctuation <no_punctuation>
        %19 = arith.cmpi ult, %arg1, %c4 : index
        scf.if %19 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      %15 = arith.cmpi ult, %arg0, %c4 : index
      scf.if %15 {
        vector.print punctuation <comma>
      }
    }
    vector.print punctuation <close>
    vector.print
    %14 = vector.shape_cast %10 : vector<5x5xf32> to vector<25xf32>
    vector.print punctuation <open>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %c5 step %c1 {
        %16 = arith.muli %arg0, %c5 : index
        %17 = arith.addi %arg1, %16 : index
        %18 = vector.extractelement %14[%17 : index] : vector<25xf32>
        vector.print %18 : f32 punctuation <no_punctuation>
        %19 = arith.cmpi ult, %arg1, %c4 : index
        scf.if %19 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      %15 = arith.cmpi ult, %arg0, %c4 : index
      scf.if %15 {
        vector.print punctuation <comma>
      }
    }
    vector.print punctuation <close>
    vector.print
    return %c0_i32 : i32
  }
}

