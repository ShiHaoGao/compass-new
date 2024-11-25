module {
  func.func @subgraph0(%arg0: tensor<1x3x224x224xf32>, %arg1: tensor<16x3x3x3xf32>, %arg2: tensor<16xf32>, %arg3: tensor<16xf32>, %arg4: tensor<16xf32>, %arg5: tensor<16xf32>, %arg6: tensor<16x1x3x3xf32>, %arg7: tensor<16xf32>, %arg8: tensor<16xf32>, %arg9: tensor<16xf32>, %arg10: tensor<16xf32>, %arg11: tensor<8x16x1x1xf32>, %arg12: tensor<8xf32>, %arg13: tensor<16x8x1x1xf32>, %arg14: tensor<16xf32>, %arg15: tensor<16x16x1x1xf32>, %arg16: tensor<16xf32>, %arg17: tensor<16xf32>, %arg18: tensor<16xf32>, %arg19: tensor<16xf32>, %arg20: tensor<72x16x1x1xf32>, %arg21: tensor<72xf32>, %arg22: tensor<72xf32>, %arg23: tensor<72xf32>, %arg24: tensor<72xf32>, %arg25: tensor<72x1x3x3xf32>, %arg26: tensor<72xf32>, %arg27: tensor<72xf32>, %arg28: tensor<72xf32>, %arg29: tensor<72xf32>, %arg30: tensor<24x72x1x1xf32>, %arg31: tensor<24xf32>, %arg32: tensor<24xf32>, %arg33: tensor<24xf32>, %arg34: tensor<24xf32>, %arg35: tensor<88x24x1x1xf32>, %arg36: tensor<88xf32>, %arg37: tensor<88xf32>, %arg38: tensor<88xf32>, %arg39: tensor<88xf32>, %arg40: tensor<88x1x3x3xf32>, %arg41: tensor<88xf32>, %arg42: tensor<88xf32>, %arg43: tensor<88xf32>, %arg44: tensor<88xf32>, %arg45: tensor<24x88x1x1xf32>, %arg46: tensor<24xf32>, %arg47: tensor<24xf32>, %arg48: tensor<24xf32>, %arg49: tensor<24xf32>, %arg50: tensor<96x24x1x1xf32>, %arg51: tensor<96xf32>, %arg52: tensor<96xf32>, %arg53: tensor<96xf32>, %arg54: tensor<96xf32>, %arg55: tensor<96x1x5x5xf32>, %arg56: tensor<96xf32>, %arg57: tensor<96xf32>, %arg58: tensor<96xf32>, %arg59: tensor<96xf32>, %arg60: tensor<24x96x1x1xf32>, %arg61: tensor<24xf32>, %arg62: tensor<96x24x1x1xf32>, %arg63: tensor<96xf32>, %arg64: tensor<40x96x1x1xf32>, %arg65: tensor<40xf32>, %arg66: tensor<40xf32>, %arg67: tensor<40xf32>, %arg68: tensor<40xf32>, %arg69: tensor<240x40x1x1xf32>, %arg70: tensor<240xf32>, %arg71: tensor<240xf32>, %arg72: tensor<240xf32>, %arg73: tensor<240xf32>, %arg74: tensor<240x1x5x5xf32>, %arg75: tensor<240xf32>, %arg76: tensor<240xf32>, %arg77: tensor<240xf32>, %arg78: tensor<240xf32>, %arg79: tensor<64x240x1x1xf32>, %arg80: tensor<64xf32>, %arg81: tensor<240x64x1x1xf32>, %arg82: tensor<240xf32>, %arg83: tensor<40x240x1x1xf32>, %arg84: tensor<40xf32>, %arg85: tensor<40xf32>, %arg86: tensor<40xf32>, %arg87: tensor<40xf32>, %arg88: tensor<240x40x1x1xf32>, %arg89: tensor<240xf32>, %arg90: tensor<240xf32>, %arg91: tensor<240xf32>, %arg92: tensor<240xf32>, %arg93: tensor<240x1x5x5xf32>, %arg94: tensor<240xf32>, %arg95: tensor<240xf32>, %arg96: tensor<240xf32>, %arg97: tensor<240xf32>, %arg98: tensor<64x240x1x1xf32>, %arg99: tensor<64xf32>, %arg100: tensor<240x64x1x1xf32>, %arg101: tensor<240xf32>, %arg102: tensor<40x240x1x1xf32>, %arg103: tensor<40xf32>, %arg104: tensor<40xf32>, %arg105: tensor<40xf32>, %arg106: tensor<40xf32>, %arg107: tensor<120x40x1x1xf32>, %arg108: tensor<120xf32>, %arg109: tensor<120xf32>, %arg110: tensor<120xf32>, %arg111: tensor<120xf32>, %arg112: tensor<120x1x5x5xf32>, %arg113: tensor<120xf32>, %arg114: tensor<120xf32>, %arg115: tensor<120xf32>, %arg116: tensor<120xf32>, %arg117: tensor<32x120x1x1xf32>, %arg118: tensor<32xf32>, %arg119: tensor<120x32x1x1xf32>, %arg120: tensor<120xf32>, %arg121: tensor<48x120x1x1xf32>, %arg122: tensor<48xf32>, %arg123: tensor<48xf32>, %arg124: tensor<48xf32>, %arg125: tensor<48xf32>, %arg126: tensor<144x48x1x1xf32>, %arg127: tensor<144xf32>, %arg128: tensor<144xf32>, %arg129: tensor<144xf32>, %arg130: tensor<144xf32>, %arg131: tensor<144x1x5x5xf32>, %arg132: tensor<144xf32>, %arg133: tensor<144xf32>, %arg134: tensor<144xf32>, %arg135: tensor<144xf32>, %arg136: tensor<40x144x1x1xf32>, %arg137: tensor<40xf32>, %arg138: tensor<144x40x1x1xf32>, %arg139: tensor<144xf32>, %arg140: tensor<48x144x1x1xf32>, %arg141: tensor<48xf32>, %arg142: tensor<48xf32>, %arg143: tensor<48xf32>, %arg144: tensor<48xf32>, %arg145: tensor<288x48x1x1xf32>, %arg146: tensor<288xf32>, %arg147: tensor<288xf32>, %arg148: tensor<288xf32>, %arg149: tensor<288xf32>, %arg150: tensor<288x1x5x5xf32>, %arg151: tensor<288xf32>, %arg152: tensor<288xf32>, %arg153: tensor<288xf32>, %arg154: tensor<288xf32>, %arg155: tensor<72x288x1x1xf32>, %arg156: tensor<72xf32>, %arg157: tensor<288x72x1x1xf32>, %arg158: tensor<288xf32>, %arg159: tensor<96x288x1x1xf32>, %arg160: tensor<96xf32>, %arg161: tensor<96xf32>, %arg162: tensor<96xf32>, %arg163: tensor<96xf32>, %arg164: tensor<576x96x1x1xf32>, %arg165: tensor<576xf32>, %arg166: tensor<576xf32>, %arg167: tensor<576xf32>, %arg168: tensor<576xf32>, %arg169: tensor<576x1x5x5xf32>, %arg170: tensor<576xf32>, %arg171: tensor<576xf32>, %arg172: tensor<576xf32>, %arg173: tensor<576xf32>, %arg174: tensor<144x576x1x1xf32>, %arg175: tensor<144xf32>, %arg176: tensor<576x144x1x1xf32>, %arg177: tensor<576xf32>, %arg178: tensor<96x576x1x1xf32>, %arg179: tensor<96xf32>, %arg180: tensor<96xf32>, %arg181: tensor<96xf32>, %arg182: tensor<96xf32>, %arg183: tensor<576x96x1x1xf32>, %arg184: tensor<576xf32>, %arg185: tensor<576xf32>, %arg186: tensor<576xf32>, %arg187: tensor<576xf32>, %arg188: tensor<576x1x5x5xf32>, %arg189: tensor<576xf32>, %arg190: tensor<576xf32>, %arg191: tensor<576xf32>, %arg192: tensor<576xf32>, %arg193: tensor<144x576x1x1xf32>, %arg194: tensor<144xf32>, %arg195: tensor<576x144x1x1xf32>, %arg196: tensor<576xf32>, %arg197: tensor<96x576x1x1xf32>, %arg198: tensor<96xf32>, %arg199: tensor<96xf32>, %arg200: tensor<96xf32>, %arg201: tensor<96xf32>, %arg202: tensor<576x96x1x1xf32>, %arg203: tensor<576xf32>, %arg204: tensor<576xf32>, %arg205: tensor<576xf32>, %arg206: tensor<576xf32>, %arg207: tensor<1024x576xf32>, %arg208: tensor<1024xf32>, %arg209: tensor<1000x1024xf32>, %arg210: tensor<1000xf32>) -> tensor<1x1000xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<16xf32>
    %cst_0 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %0 = tosa.transpose %arg0, %cst_0 : (tensor<1x3x224x224xf32>, tensor<4xi32>) -> tensor<1x224x224x3xf32>
    %cst_1 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %1 = tosa.transpose %arg1, %cst_1 : (tensor<16x3x3x3xf32>, tensor<4xi32>) -> tensor<16x3x3x3xf32>
    %2 = tosa.conv2d %0, %1, %cst {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 2, 2>} : (tensor<1x224x224x3xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>) -> tensor<1x112x112x16xf32>
    %cst_2 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %3 = tosa.transpose %2, %cst_2 : (tensor<1x112x112x16xf32>, tensor<4xi32>) -> tensor<1x16x112x112xf32>
    %cst_3 = arith.constant dense<1.000000e-03> : tensor<16xf32>
    %4 = tosa.add %arg3, %cst_3 : (tensor<16xf32>, tensor<16xf32>) -> tensor<16xf32>
    %5 = math.sqrt %4 : tensor<16xf32>
    %6 = tosa.reciprocal %5 : (tensor<16xf32>) -> tensor<16xf32>
    %cst_4 = arith.constant dense<1.000000e+00> : tensor<16xf32>
    %7 = tosa.reshape %arg2 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %8 = tosa.reshape %arg2 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %9 = tosa.reshape %6 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %10 = tosa.reshape %6 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %11 = tosa.reshape %arg2 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %12 = tosa.sub %3, %11 : (tensor<1x16x112x112xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x112x112xf32>
    %13 = tosa.reshape %6 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %14 = tosa.mul %12, %13 {shift = 0 : i8} : (tensor<1x16x112x112xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x112x112xf32>
    %15 = tosa.reshape %arg4 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %16 = tosa.reshape %arg4 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %17 = tosa.reshape %arg4 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %18 = tosa.mul %14, %17 {shift = 0 : i8} : (tensor<1x16x112x112xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x112x112xf32>
    %19 = tosa.reshape %arg5 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %20 = tosa.reshape %arg5 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %21 = tosa.reshape %arg5 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %22 = tosa.add %18, %21 : (tensor<1x16x112x112xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x112x112xf32>
    %cst_5 = arith.constant dense<3.000000e+00> : tensor<1x16x112x112xf32>
    %23 = tosa.add %22, %cst_5 : (tensor<1x16x112x112xf32>, tensor<1x16x112x112xf32>) -> tensor<1x16x112x112xf32>
    %24 = tosa.clamp %23 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x16x112x112xf32>) -> tensor<1x16x112x112xf32>
    %25 = tosa.clamp %24 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x16x112x112xf32>) -> tensor<1x16x112x112xf32>
    %26 = tosa.mul %22, %25 {shift = 0 : i8} : (tensor<1x16x112x112xf32>, tensor<1x16x112x112xf32>) -> tensor<1x16x112x112xf32>
    %cst_6 = arith.constant dense<6.000000e+00> : tensor<1x16x112x112xf32>
    %cst_7 = arith.constant dense<0.166666672> : tensor<1x16x112x112xf32>
    %27 = tosa.mul %26, %cst_7 {shift = 0 : i8} : (tensor<1x16x112x112xf32>, tensor<1x16x112x112xf32>) -> tensor<1x16x112x112xf32>
    %cst_8 = arith.constant dense<0.000000e+00> : tensor<16xf32>
    %cst_9 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %28 = tosa.transpose %27, %cst_9 : (tensor<1x16x112x112xf32>, tensor<4xi32>) -> tensor<1x112x112x16xf32>
    %cst_10 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %29 = tosa.transpose %arg6, %cst_10 : (tensor<16x1x3x3xf32>, tensor<4xi32>) -> tensor<3x3x16x1xf32>
    %30 = tosa.depthwise_conv2d %28, %29, %cst_8 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 2, 2>} : (tensor<1x112x112x16xf32>, tensor<3x3x16x1xf32>, tensor<16xf32>) -> tensor<1x56x56x16xf32>
    %cst_11 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %31 = tosa.transpose %30, %cst_11 : (tensor<1x56x56x16xf32>, tensor<4xi32>) -> tensor<1x16x56x56xf32>
    %cst_12 = arith.constant dense<1.000000e-03> : tensor<16xf32>
    %32 = tosa.add %arg8, %cst_12 : (tensor<16xf32>, tensor<16xf32>) -> tensor<16xf32>
    %33 = math.sqrt %32 : tensor<16xf32>
    %34 = tosa.reciprocal %33 : (tensor<16xf32>) -> tensor<16xf32>
    %cst_13 = arith.constant dense<1.000000e+00> : tensor<16xf32>
    %35 = tosa.reshape %arg7 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %36 = tosa.reshape %arg7 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %37 = tosa.reshape %34 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %38 = tosa.reshape %34 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %39 = tosa.reshape %arg7 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %40 = tosa.sub %31, %39 : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %41 = tosa.reshape %34 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %42 = tosa.mul %40, %41 {shift = 0 : i8} : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %43 = tosa.reshape %arg9 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %44 = tosa.reshape %arg9 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %45 = tosa.reshape %arg9 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %46 = tosa.mul %42, %45 {shift = 0 : i8} : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %47 = tosa.reshape %arg10 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %48 = tosa.reshape %arg10 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %49 = tosa.reshape %arg10 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %50 = tosa.add %46, %49 : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %cst_14 = arith.constant dense<0.000000e+00> : tensor<1x16x56x56xf32>
    %51 = tosa.maximum %50, %cst_14 : (tensor<1x16x56x56xf32>, tensor<1x16x56x56xf32>) -> tensor<1x16x56x56xf32>
    %52 = tosa.reduce_sum %51 {axis = 3 : i32} : (tensor<1x16x56x56xf32>) -> tensor<1x16x56x1xf32>
    %53 = tosa.reduce_sum %52 {axis = 2 : i32} : (tensor<1x16x56x1xf32>) -> tensor<1x16x1x1xf32>
    %cst_15 = arith.constant dense<3.136000e+03> : tensor<1xf32>
    %cst_16 = arith.constant dense<3.18877544E-4> : tensor<1xf32>
    %54 = tosa.mul %cst_16, %53 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x1x1xf32>
    %cst_17 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %55 = tosa.transpose %54, %cst_17 : (tensor<1x16x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x16xf32>
    %cst_18 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %56 = tosa.transpose %arg11, %cst_18 : (tensor<8x16x1x1xf32>, tensor<4xi32>) -> tensor<8x1x1x16xf32>
    %57 = tosa.conv2d %55, %56, %arg12 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x16xf32>, tensor<8x1x1x16xf32>, tensor<8xf32>) -> tensor<1x1x1x8xf32>
    %cst_19 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %58 = tosa.transpose %57, %cst_19 : (tensor<1x1x1x8xf32>, tensor<4xi32>) -> tensor<1x8x1x1xf32>
    %cst_20 = arith.constant dense<0.000000e+00> : tensor<1x8x1x1xf32>
    %59 = tosa.maximum %58, %cst_20 : (tensor<1x8x1x1xf32>, tensor<1x8x1x1xf32>) -> tensor<1x8x1x1xf32>
    %cst_21 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %60 = tosa.transpose %59, %cst_21 : (tensor<1x8x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x8xf32>
    %cst_22 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %61 = tosa.transpose %arg13, %cst_22 : (tensor<16x8x1x1xf32>, tensor<4xi32>) -> tensor<16x1x1x8xf32>
    %62 = tosa.conv2d %60, %61, %arg14 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>) -> tensor<1x1x1x16xf32>
    %cst_23 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %63 = tosa.transpose %62, %cst_23 : (tensor<1x1x1x16xf32>, tensor<4xi32>) -> tensor<1x16x1x1xf32>
    %cst_24 = arith.constant dense<3.000000e+00> : tensor<1x16x1x1xf32>
    %64 = tosa.add %63, %cst_24 : (tensor<1x16x1x1xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x1x1xf32>
    %65 = tosa.clamp %64 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x16x1x1xf32>) -> tensor<1x16x1x1xf32>
    %66 = tosa.clamp %65 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x16x1x1xf32>) -> tensor<1x16x1x1xf32>
    %cst_25 = arith.constant dense<6.000000e+00> : tensor<1x16x1x1xf32>
    %cst_26 = arith.constant dense<0.166666672> : tensor<1x16x1x1xf32>
    %67 = tosa.mul %66, %cst_26 {shift = 0 : i8} : (tensor<1x16x1x1xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x1x1xf32>
    %68 = tosa.mul %67, %51 {shift = 0 : i8} : (tensor<1x16x1x1xf32>, tensor<1x16x56x56xf32>) -> tensor<1x16x56x56xf32>
    %cst_27 = arith.constant dense<0.000000e+00> : tensor<16xf32>
    %cst_28 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %69 = tosa.transpose %68, %cst_28 : (tensor<1x16x56x56xf32>, tensor<4xi32>) -> tensor<1x56x56x16xf32>
    %cst_29 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %70 = tosa.transpose %arg15, %cst_29 : (tensor<16x16x1x1xf32>, tensor<4xi32>) -> tensor<16x1x1x16xf32>
    %71 = tosa.conv2d %69, %70, %cst_27 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x56x56x16xf32>, tensor<16x1x1x16xf32>, tensor<16xf32>) -> tensor<1x56x56x16xf32>
    %cst_30 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %72 = tosa.transpose %71, %cst_30 : (tensor<1x56x56x16xf32>, tensor<4xi32>) -> tensor<1x16x56x56xf32>
    %cst_31 = arith.constant dense<1.000000e-03> : tensor<16xf32>
    %73 = tosa.add %arg17, %cst_31 : (tensor<16xf32>, tensor<16xf32>) -> tensor<16xf32>
    %74 = math.sqrt %73 : tensor<16xf32>
    %75 = tosa.reciprocal %74 : (tensor<16xf32>) -> tensor<16xf32>
    %cst_32 = arith.constant dense<1.000000e+00> : tensor<16xf32>
    %76 = tosa.reshape %arg16 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %77 = tosa.reshape %arg16 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %78 = tosa.reshape %75 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %79 = tosa.reshape %75 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %80 = tosa.reshape %arg16 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %81 = tosa.sub %72, %80 : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %82 = tosa.reshape %75 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %83 = tosa.mul %81, %82 {shift = 0 : i8} : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %84 = tosa.reshape %arg18 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %85 = tosa.reshape %arg18 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %86 = tosa.reshape %arg18 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %87 = tosa.mul %83, %86 {shift = 0 : i8} : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %88 = tosa.reshape %arg19 {new_shape = array<i64: 16, 1>} : (tensor<16xf32>) -> tensor<16x1xf32>
    %89 = tosa.reshape %arg19 {new_shape = array<i64: 16, 1, 1>} : (tensor<16xf32>) -> tensor<16x1x1xf32>
    %90 = tosa.reshape %arg19 {new_shape = array<i64: 1, 16, 1, 1>} : (tensor<16xf32>) -> tensor<1x16x1x1xf32>
    %91 = tosa.add %87, %90 : (tensor<1x16x56x56xf32>, tensor<1x16x1x1xf32>) -> tensor<1x16x56x56xf32>
    %cst_33 = arith.constant dense<0.000000e+00> : tensor<72xf32>
    %cst_34 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %92 = tosa.transpose %91, %cst_34 : (tensor<1x16x56x56xf32>, tensor<4xi32>) -> tensor<1x56x56x16xf32>
    %cst_35 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %93 = tosa.transpose %arg20, %cst_35 : (tensor<72x16x1x1xf32>, tensor<4xi32>) -> tensor<72x1x1x16xf32>
    %94 = tosa.conv2d %92, %93, %cst_33 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x56x56x16xf32>, tensor<72x1x1x16xf32>, tensor<72xf32>) -> tensor<1x56x56x72xf32>
    %cst_36 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %95 = tosa.transpose %94, %cst_36 : (tensor<1x56x56x72xf32>, tensor<4xi32>) -> tensor<1x72x56x56xf32>
    %cst_37 = arith.constant dense<1.000000e-03> : tensor<72xf32>
    %96 = tosa.add %arg22, %cst_37 : (tensor<72xf32>, tensor<72xf32>) -> tensor<72xf32>
    %97 = math.sqrt %96 : tensor<72xf32>
    %98 = tosa.reciprocal %97 : (tensor<72xf32>) -> tensor<72xf32>
    %cst_38 = arith.constant dense<1.000000e+00> : tensor<72xf32>
    %99 = tosa.reshape %arg21 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %100 = tosa.reshape %arg21 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %101 = tosa.reshape %98 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %102 = tosa.reshape %98 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %103 = tosa.reshape %arg21 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %104 = tosa.sub %95, %103 : (tensor<1x72x56x56xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x56x56xf32>
    %105 = tosa.reshape %98 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %106 = tosa.mul %104, %105 {shift = 0 : i8} : (tensor<1x72x56x56xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x56x56xf32>
    %107 = tosa.reshape %arg23 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %108 = tosa.reshape %arg23 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %109 = tosa.reshape %arg23 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %110 = tosa.mul %106, %109 {shift = 0 : i8} : (tensor<1x72x56x56xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x56x56xf32>
    %111 = tosa.reshape %arg24 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %112 = tosa.reshape %arg24 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %113 = tosa.reshape %arg24 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %114 = tosa.add %110, %113 : (tensor<1x72x56x56xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x56x56xf32>
    %cst_39 = arith.constant dense<0.000000e+00> : tensor<1x72x56x56xf32>
    %115 = tosa.maximum %114, %cst_39 : (tensor<1x72x56x56xf32>, tensor<1x72x56x56xf32>) -> tensor<1x72x56x56xf32>
    %cst_40 = arith.constant dense<0.000000e+00> : tensor<72xf32>
    %cst_41 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %116 = tosa.transpose %115, %cst_41 : (tensor<1x72x56x56xf32>, tensor<4xi32>) -> tensor<1x56x56x72xf32>
    %cst_42 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %117 = tosa.transpose %arg25, %cst_42 : (tensor<72x1x3x3xf32>, tensor<4xi32>) -> tensor<3x3x72x1xf32>
    %118 = tosa.depthwise_conv2d %116, %117, %cst_40 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 2, 2>} : (tensor<1x56x56x72xf32>, tensor<3x3x72x1xf32>, tensor<72xf32>) -> tensor<1x28x28x72xf32>
    %cst_43 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %119 = tosa.transpose %118, %cst_43 : (tensor<1x28x28x72xf32>, tensor<4xi32>) -> tensor<1x72x28x28xf32>
    %cst_44 = arith.constant dense<1.000000e-03> : tensor<72xf32>
    %120 = tosa.add %arg27, %cst_44 : (tensor<72xf32>, tensor<72xf32>) -> tensor<72xf32>
    %121 = math.sqrt %120 : tensor<72xf32>
    %122 = tosa.reciprocal %121 : (tensor<72xf32>) -> tensor<72xf32>
    %cst_45 = arith.constant dense<1.000000e+00> : tensor<72xf32>
    %123 = tosa.reshape %arg26 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %124 = tosa.reshape %arg26 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %125 = tosa.reshape %122 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %126 = tosa.reshape %122 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %127 = tosa.reshape %arg26 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %128 = tosa.sub %119, %127 : (tensor<1x72x28x28xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x28x28xf32>
    %129 = tosa.reshape %122 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %130 = tosa.mul %128, %129 {shift = 0 : i8} : (tensor<1x72x28x28xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x28x28xf32>
    %131 = tosa.reshape %arg28 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %132 = tosa.reshape %arg28 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %133 = tosa.reshape %arg28 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %134 = tosa.mul %130, %133 {shift = 0 : i8} : (tensor<1x72x28x28xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x28x28xf32>
    %135 = tosa.reshape %arg29 {new_shape = array<i64: 72, 1>} : (tensor<72xf32>) -> tensor<72x1xf32>
    %136 = tosa.reshape %arg29 {new_shape = array<i64: 72, 1, 1>} : (tensor<72xf32>) -> tensor<72x1x1xf32>
    %137 = tosa.reshape %arg29 {new_shape = array<i64: 1, 72, 1, 1>} : (tensor<72xf32>) -> tensor<1x72x1x1xf32>
    %138 = tosa.add %134, %137 : (tensor<1x72x28x28xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x28x28xf32>
    %cst_46 = arith.constant dense<0.000000e+00> : tensor<1x72x28x28xf32>
    %139 = tosa.maximum %138, %cst_46 : (tensor<1x72x28x28xf32>, tensor<1x72x28x28xf32>) -> tensor<1x72x28x28xf32>
    %cst_47 = arith.constant dense<0.000000e+00> : tensor<24xf32>
    %cst_48 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %140 = tosa.transpose %139, %cst_48 : (tensor<1x72x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x72xf32>
    %cst_49 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %141 = tosa.transpose %arg30, %cst_49 : (tensor<24x72x1x1xf32>, tensor<4xi32>) -> tensor<24x1x1x72xf32>
    %142 = tosa.conv2d %140, %141, %cst_47 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x28x28x72xf32>, tensor<24x1x1x72xf32>, tensor<24xf32>) -> tensor<1x28x28x24xf32>
    %cst_50 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %143 = tosa.transpose %142, %cst_50 : (tensor<1x28x28x24xf32>, tensor<4xi32>) -> tensor<1x24x28x28xf32>
    %cst_51 = arith.constant dense<1.000000e-03> : tensor<24xf32>
    %144 = tosa.add %arg32, %cst_51 : (tensor<24xf32>, tensor<24xf32>) -> tensor<24xf32>
    %145 = math.sqrt %144 : tensor<24xf32>
    %146 = tosa.reciprocal %145 : (tensor<24xf32>) -> tensor<24xf32>
    %cst_52 = arith.constant dense<1.000000e+00> : tensor<24xf32>
    %147 = tosa.reshape %arg31 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %148 = tosa.reshape %arg31 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %149 = tosa.reshape %146 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %150 = tosa.reshape %146 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %151 = tosa.reshape %arg31 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %152 = tosa.sub %143, %151 : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %153 = tosa.reshape %146 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %154 = tosa.mul %152, %153 {shift = 0 : i8} : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %155 = tosa.reshape %arg33 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %156 = tosa.reshape %arg33 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %157 = tosa.reshape %arg33 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %158 = tosa.mul %154, %157 {shift = 0 : i8} : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %159 = tosa.reshape %arg34 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %160 = tosa.reshape %arg34 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %161 = tosa.reshape %arg34 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %162 = tosa.add %158, %161 : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %cst_53 = arith.constant dense<0.000000e+00> : tensor<88xf32>
    %cst_54 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %163 = tosa.transpose %162, %cst_54 : (tensor<1x24x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x24xf32>
    %cst_55 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %164 = tosa.transpose %arg35, %cst_55 : (tensor<88x24x1x1xf32>, tensor<4xi32>) -> tensor<88x1x1x24xf32>
    %165 = tosa.conv2d %163, %164, %cst_53 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x28x28x24xf32>, tensor<88x1x1x24xf32>, tensor<88xf32>) -> tensor<1x28x28x88xf32>
    %cst_56 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %166 = tosa.transpose %165, %cst_56 : (tensor<1x28x28x88xf32>, tensor<4xi32>) -> tensor<1x88x28x28xf32>
    %cst_57 = arith.constant dense<1.000000e-03> : tensor<88xf32>
    %167 = tosa.add %arg37, %cst_57 : (tensor<88xf32>, tensor<88xf32>) -> tensor<88xf32>
    %168 = math.sqrt %167 : tensor<88xf32>
    %169 = tosa.reciprocal %168 : (tensor<88xf32>) -> tensor<88xf32>
    %cst_58 = arith.constant dense<1.000000e+00> : tensor<88xf32>
    %170 = tosa.reshape %arg36 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %171 = tosa.reshape %arg36 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %172 = tosa.reshape %169 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %173 = tosa.reshape %169 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %174 = tosa.reshape %arg36 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %175 = tosa.sub %166, %174 : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %176 = tosa.reshape %169 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %177 = tosa.mul %175, %176 {shift = 0 : i8} : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %178 = tosa.reshape %arg38 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %179 = tosa.reshape %arg38 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %180 = tosa.reshape %arg38 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %181 = tosa.mul %177, %180 {shift = 0 : i8} : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %182 = tosa.reshape %arg39 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %183 = tosa.reshape %arg39 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %184 = tosa.reshape %arg39 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %185 = tosa.add %181, %184 : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %cst_59 = arith.constant dense<0.000000e+00> : tensor<1x88x28x28xf32>
    %186 = tosa.maximum %185, %cst_59 : (tensor<1x88x28x28xf32>, tensor<1x88x28x28xf32>) -> tensor<1x88x28x28xf32>
    %cst_60 = arith.constant dense<0.000000e+00> : tensor<88xf32>
    %cst_61 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %187 = tosa.transpose %186, %cst_61 : (tensor<1x88x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x88xf32>
    %cst_62 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %188 = tosa.transpose %arg40, %cst_62 : (tensor<88x1x3x3xf32>, tensor<4xi32>) -> tensor<3x3x88x1xf32>
    %189 = tosa.depthwise_conv2d %187, %188, %cst_60 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x28x28x88xf32>, tensor<3x3x88x1xf32>, tensor<88xf32>) -> tensor<1x28x28x88xf32>
    %cst_63 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %190 = tosa.transpose %189, %cst_63 : (tensor<1x28x28x88xf32>, tensor<4xi32>) -> tensor<1x88x28x28xf32>
    %cst_64 = arith.constant dense<1.000000e-03> : tensor<88xf32>
    %191 = tosa.add %arg42, %cst_64 : (tensor<88xf32>, tensor<88xf32>) -> tensor<88xf32>
    %192 = math.sqrt %191 : tensor<88xf32>
    %193 = tosa.reciprocal %192 : (tensor<88xf32>) -> tensor<88xf32>
    %cst_65 = arith.constant dense<1.000000e+00> : tensor<88xf32>
    %194 = tosa.reshape %arg41 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %195 = tosa.reshape %arg41 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %196 = tosa.reshape %193 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %197 = tosa.reshape %193 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %198 = tosa.reshape %arg41 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %199 = tosa.sub %190, %198 : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %200 = tosa.reshape %193 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %201 = tosa.mul %199, %200 {shift = 0 : i8} : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %202 = tosa.reshape %arg43 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %203 = tosa.reshape %arg43 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %204 = tosa.reshape %arg43 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %205 = tosa.mul %201, %204 {shift = 0 : i8} : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %206 = tosa.reshape %arg44 {new_shape = array<i64: 88, 1>} : (tensor<88xf32>) -> tensor<88x1xf32>
    %207 = tosa.reshape %arg44 {new_shape = array<i64: 88, 1, 1>} : (tensor<88xf32>) -> tensor<88x1x1xf32>
    %208 = tosa.reshape %arg44 {new_shape = array<i64: 1, 88, 1, 1>} : (tensor<88xf32>) -> tensor<1x88x1x1xf32>
    %209 = tosa.add %205, %208 : (tensor<1x88x28x28xf32>, tensor<1x88x1x1xf32>) -> tensor<1x88x28x28xf32>
    %cst_66 = arith.constant dense<0.000000e+00> : tensor<1x88x28x28xf32>
    %210 = tosa.maximum %209, %cst_66 : (tensor<1x88x28x28xf32>, tensor<1x88x28x28xf32>) -> tensor<1x88x28x28xf32>
    %cst_67 = arith.constant dense<0.000000e+00> : tensor<24xf32>
    %cst_68 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %211 = tosa.transpose %210, %cst_68 : (tensor<1x88x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x88xf32>
    %cst_69 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %212 = tosa.transpose %arg45, %cst_69 : (tensor<24x88x1x1xf32>, tensor<4xi32>) -> tensor<24x1x1x88xf32>
    %213 = tosa.conv2d %211, %212, %cst_67 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x28x28x88xf32>, tensor<24x1x1x88xf32>, tensor<24xf32>) -> tensor<1x28x28x24xf32>
    %cst_70 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %214 = tosa.transpose %213, %cst_70 : (tensor<1x28x28x24xf32>, tensor<4xi32>) -> tensor<1x24x28x28xf32>
    %cst_71 = arith.constant dense<1.000000e-03> : tensor<24xf32>
    %215 = tosa.add %arg47, %cst_71 : (tensor<24xf32>, tensor<24xf32>) -> tensor<24xf32>
    %216 = math.sqrt %215 : tensor<24xf32>
    %217 = tosa.reciprocal %216 : (tensor<24xf32>) -> tensor<24xf32>
    %cst_72 = arith.constant dense<1.000000e+00> : tensor<24xf32>
    %218 = tosa.reshape %arg46 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %219 = tosa.reshape %arg46 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %220 = tosa.reshape %217 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %221 = tosa.reshape %217 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %222 = tosa.reshape %arg46 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %223 = tosa.sub %214, %222 : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %224 = tosa.reshape %217 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %225 = tosa.mul %223, %224 {shift = 0 : i8} : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %226 = tosa.reshape %arg48 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %227 = tosa.reshape %arg48 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %228 = tosa.reshape %arg48 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %229 = tosa.mul %225, %228 {shift = 0 : i8} : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %230 = tosa.reshape %arg49 {new_shape = array<i64: 24, 1>} : (tensor<24xf32>) -> tensor<24x1xf32>
    %231 = tosa.reshape %arg49 {new_shape = array<i64: 24, 1, 1>} : (tensor<24xf32>) -> tensor<24x1x1xf32>
    %232 = tosa.reshape %arg49 {new_shape = array<i64: 1, 24, 1, 1>} : (tensor<24xf32>) -> tensor<1x24x1x1xf32>
    %233 = tosa.add %229, %232 : (tensor<1x24x28x28xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x28x28xf32>
    %234 = tosa.add %233, %162 : (tensor<1x24x28x28xf32>, tensor<1x24x28x28xf32>) -> tensor<1x24x28x28xf32>
    %cst_73 = arith.constant dense<0.000000e+00> : tensor<96xf32>
    %cst_74 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %235 = tosa.transpose %234, %cst_74 : (tensor<1x24x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x24xf32>
    %cst_75 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %236 = tosa.transpose %arg50, %cst_75 : (tensor<96x24x1x1xf32>, tensor<4xi32>) -> tensor<96x1x1x24xf32>
    %237 = tosa.conv2d %235, %236, %cst_73 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x28x28x24xf32>, tensor<96x1x1x24xf32>, tensor<96xf32>) -> tensor<1x28x28x96xf32>
    %cst_76 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %238 = tosa.transpose %237, %cst_76 : (tensor<1x28x28x96xf32>, tensor<4xi32>) -> tensor<1x96x28x28xf32>
    %cst_77 = arith.constant dense<1.000000e-03> : tensor<96xf32>
    %239 = tosa.add %arg52, %cst_77 : (tensor<96xf32>, tensor<96xf32>) -> tensor<96xf32>
    %240 = math.sqrt %239 : tensor<96xf32>
    %241 = tosa.reciprocal %240 : (tensor<96xf32>) -> tensor<96xf32>
    %cst_78 = arith.constant dense<1.000000e+00> : tensor<96xf32>
    %242 = tosa.reshape %arg51 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %243 = tosa.reshape %arg51 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %244 = tosa.reshape %241 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %245 = tosa.reshape %241 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %246 = tosa.reshape %arg51 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %247 = tosa.sub %238, %246 : (tensor<1x96x28x28xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x28x28xf32>
    %248 = tosa.reshape %241 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %249 = tosa.mul %247, %248 {shift = 0 : i8} : (tensor<1x96x28x28xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x28x28xf32>
    %250 = tosa.reshape %arg53 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %251 = tosa.reshape %arg53 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %252 = tosa.reshape %arg53 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %253 = tosa.mul %249, %252 {shift = 0 : i8} : (tensor<1x96x28x28xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x28x28xf32>
    %254 = tosa.reshape %arg54 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %255 = tosa.reshape %arg54 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %256 = tosa.reshape %arg54 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %257 = tosa.add %253, %256 : (tensor<1x96x28x28xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x28x28xf32>
    %cst_79 = arith.constant dense<3.000000e+00> : tensor<1x96x28x28xf32>
    %258 = tosa.add %257, %cst_79 : (tensor<1x96x28x28xf32>, tensor<1x96x28x28xf32>) -> tensor<1x96x28x28xf32>
    %259 = tosa.clamp %258 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x96x28x28xf32>) -> tensor<1x96x28x28xf32>
    %260 = tosa.clamp %259 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x96x28x28xf32>) -> tensor<1x96x28x28xf32>
    %261 = tosa.mul %257, %260 {shift = 0 : i8} : (tensor<1x96x28x28xf32>, tensor<1x96x28x28xf32>) -> tensor<1x96x28x28xf32>
    %cst_80 = arith.constant dense<6.000000e+00> : tensor<1x96x28x28xf32>
    %cst_81 = arith.constant dense<0.166666672> : tensor<1x96x28x28xf32>
    %262 = tosa.mul %261, %cst_81 {shift = 0 : i8} : (tensor<1x96x28x28xf32>, tensor<1x96x28x28xf32>) -> tensor<1x96x28x28xf32>
    %cst_82 = arith.constant dense<0.000000e+00> : tensor<96xf32>
    %cst_83 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %263 = tosa.transpose %262, %cst_83 : (tensor<1x96x28x28xf32>, tensor<4xi32>) -> tensor<1x28x28x96xf32>
    %cst_84 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %264 = tosa.transpose %arg55, %cst_84 : (tensor<96x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x96x1xf32>
    %265 = tosa.depthwise_conv2d %263, %264, %cst_82 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 2, 2>} : (tensor<1x28x28x96xf32>, tensor<5x5x96x1xf32>, tensor<96xf32>) -> tensor<1x14x14x96xf32>
    %cst_85 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %266 = tosa.transpose %265, %cst_85 : (tensor<1x14x14x96xf32>, tensor<4xi32>) -> tensor<1x96x14x14xf32>
    %cst_86 = arith.constant dense<1.000000e-03> : tensor<96xf32>
    %267 = tosa.add %arg57, %cst_86 : (tensor<96xf32>, tensor<96xf32>) -> tensor<96xf32>
    %268 = math.sqrt %267 : tensor<96xf32>
    %269 = tosa.reciprocal %268 : (tensor<96xf32>) -> tensor<96xf32>
    %cst_87 = arith.constant dense<1.000000e+00> : tensor<96xf32>
    %270 = tosa.reshape %arg56 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %271 = tosa.reshape %arg56 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %272 = tosa.reshape %269 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %273 = tosa.reshape %269 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %274 = tosa.reshape %arg56 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %275 = tosa.sub %266, %274 : (tensor<1x96x14x14xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x14x14xf32>
    %276 = tosa.reshape %269 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %277 = tosa.mul %275, %276 {shift = 0 : i8} : (tensor<1x96x14x14xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x14x14xf32>
    %278 = tosa.reshape %arg58 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %279 = tosa.reshape %arg58 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %280 = tosa.reshape %arg58 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %281 = tosa.mul %277, %280 {shift = 0 : i8} : (tensor<1x96x14x14xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x14x14xf32>
    %282 = tosa.reshape %arg59 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %283 = tosa.reshape %arg59 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %284 = tosa.reshape %arg59 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %285 = tosa.add %281, %284 : (tensor<1x96x14x14xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x14x14xf32>
    %cst_88 = arith.constant dense<3.000000e+00> : tensor<1x96x14x14xf32>
    %286 = tosa.add %285, %cst_88 : (tensor<1x96x14x14xf32>, tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %287 = tosa.clamp %286 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %288 = tosa.clamp %287 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %289 = tosa.mul %285, %288 {shift = 0 : i8} : (tensor<1x96x14x14xf32>, tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %cst_89 = arith.constant dense<6.000000e+00> : tensor<1x96x14x14xf32>
    %cst_90 = arith.constant dense<0.166666672> : tensor<1x96x14x14xf32>
    %290 = tosa.mul %289, %cst_90 {shift = 0 : i8} : (tensor<1x96x14x14xf32>, tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %291 = tosa.reduce_sum %290 {axis = 3 : i32} : (tensor<1x96x14x14xf32>) -> tensor<1x96x14x1xf32>
    %292 = tosa.reduce_sum %291 {axis = 2 : i32} : (tensor<1x96x14x1xf32>) -> tensor<1x96x1x1xf32>
    %cst_91 = arith.constant dense<1.960000e+02> : tensor<1xf32>
    %cst_92 = arith.constant dense<0.00510204071> : tensor<1xf32>
    %293 = tosa.mul %cst_92, %292 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x1x1xf32>
    %cst_93 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %294 = tosa.transpose %293, %cst_93 : (tensor<1x96x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x96xf32>
    %cst_94 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %295 = tosa.transpose %arg60, %cst_94 : (tensor<24x96x1x1xf32>, tensor<4xi32>) -> tensor<24x1x1x96xf32>
    %296 = tosa.conv2d %294, %295, %arg61 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x96xf32>, tensor<24x1x1x96xf32>, tensor<24xf32>) -> tensor<1x1x1x24xf32>
    %cst_95 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %297 = tosa.transpose %296, %cst_95 : (tensor<1x1x1x24xf32>, tensor<4xi32>) -> tensor<1x24x1x1xf32>
    %cst_96 = arith.constant dense<0.000000e+00> : tensor<1x24x1x1xf32>
    %298 = tosa.maximum %297, %cst_96 : (tensor<1x24x1x1xf32>, tensor<1x24x1x1xf32>) -> tensor<1x24x1x1xf32>
    %cst_97 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %299 = tosa.transpose %298, %cst_97 : (tensor<1x24x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x24xf32>
    %cst_98 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %300 = tosa.transpose %arg62, %cst_98 : (tensor<96x24x1x1xf32>, tensor<4xi32>) -> tensor<96x1x1x24xf32>
    %301 = tosa.conv2d %299, %300, %arg63 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x24xf32>, tensor<96x1x1x24xf32>, tensor<96xf32>) -> tensor<1x1x1x96xf32>
    %cst_99 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %302 = tosa.transpose %301, %cst_99 : (tensor<1x1x1x96xf32>, tensor<4xi32>) -> tensor<1x96x1x1xf32>
    %cst_100 = arith.constant dense<3.000000e+00> : tensor<1x96x1x1xf32>
    %303 = tosa.add %302, %cst_100 : (tensor<1x96x1x1xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x1x1xf32>
    %304 = tosa.clamp %303 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x96x1x1xf32>) -> tensor<1x96x1x1xf32>
    %305 = tosa.clamp %304 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x96x1x1xf32>) -> tensor<1x96x1x1xf32>
    %cst_101 = arith.constant dense<6.000000e+00> : tensor<1x96x1x1xf32>
    %cst_102 = arith.constant dense<0.166666672> : tensor<1x96x1x1xf32>
    %306 = tosa.mul %305, %cst_102 {shift = 0 : i8} : (tensor<1x96x1x1xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x1x1xf32>
    %307 = tosa.mul %306, %290 {shift = 0 : i8} : (tensor<1x96x1x1xf32>, tensor<1x96x14x14xf32>) -> tensor<1x96x14x14xf32>
    %cst_103 = arith.constant dense<0.000000e+00> : tensor<40xf32>
    %cst_104 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %308 = tosa.transpose %307, %cst_104 : (tensor<1x96x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x96xf32>
    %cst_105 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %309 = tosa.transpose %arg64, %cst_105 : (tensor<40x96x1x1xf32>, tensor<4xi32>) -> tensor<40x1x1x96xf32>
    %310 = tosa.conv2d %308, %309, %cst_103 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x96xf32>, tensor<40x1x1x96xf32>, tensor<40xf32>) -> tensor<1x14x14x40xf32>
    %cst_106 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %311 = tosa.transpose %310, %cst_106 : (tensor<1x14x14x40xf32>, tensor<4xi32>) -> tensor<1x40x14x14xf32>
    %cst_107 = arith.constant dense<1.000000e-03> : tensor<40xf32>
    %312 = tosa.add %arg66, %cst_107 : (tensor<40xf32>, tensor<40xf32>) -> tensor<40xf32>
    %313 = math.sqrt %312 : tensor<40xf32>
    %314 = tosa.reciprocal %313 : (tensor<40xf32>) -> tensor<40xf32>
    %cst_108 = arith.constant dense<1.000000e+00> : tensor<40xf32>
    %315 = tosa.reshape %arg65 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %316 = tosa.reshape %arg65 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %317 = tosa.reshape %314 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %318 = tosa.reshape %314 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %319 = tosa.reshape %arg65 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %320 = tosa.sub %311, %319 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %321 = tosa.reshape %314 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %322 = tosa.mul %320, %321 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %323 = tosa.reshape %arg67 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %324 = tosa.reshape %arg67 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %325 = tosa.reshape %arg67 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %326 = tosa.mul %322, %325 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %327 = tosa.reshape %arg68 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %328 = tosa.reshape %arg68 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %329 = tosa.reshape %arg68 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %330 = tosa.add %326, %329 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %cst_109 = arith.constant dense<0.000000e+00> : tensor<240xf32>
    %cst_110 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %331 = tosa.transpose %330, %cst_110 : (tensor<1x40x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x40xf32>
    %cst_111 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %332 = tosa.transpose %arg69, %cst_111 : (tensor<240x40x1x1xf32>, tensor<4xi32>) -> tensor<240x1x1x40xf32>
    %333 = tosa.conv2d %331, %332, %cst_109 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x40xf32>, tensor<240x1x1x40xf32>, tensor<240xf32>) -> tensor<1x14x14x240xf32>
    %cst_112 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %334 = tosa.transpose %333, %cst_112 : (tensor<1x14x14x240xf32>, tensor<4xi32>) -> tensor<1x240x14x14xf32>
    %cst_113 = arith.constant dense<1.000000e-03> : tensor<240xf32>
    %335 = tosa.add %arg71, %cst_113 : (tensor<240xf32>, tensor<240xf32>) -> tensor<240xf32>
    %336 = math.sqrt %335 : tensor<240xf32>
    %337 = tosa.reciprocal %336 : (tensor<240xf32>) -> tensor<240xf32>
    %cst_114 = arith.constant dense<1.000000e+00> : tensor<240xf32>
    %338 = tosa.reshape %arg70 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %339 = tosa.reshape %arg70 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %340 = tosa.reshape %337 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %341 = tosa.reshape %337 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %342 = tosa.reshape %arg70 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %343 = tosa.sub %334, %342 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %344 = tosa.reshape %337 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %345 = tosa.mul %343, %344 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %346 = tosa.reshape %arg72 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %347 = tosa.reshape %arg72 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %348 = tosa.reshape %arg72 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %349 = tosa.mul %345, %348 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %350 = tosa.reshape %arg73 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %351 = tosa.reshape %arg73 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %352 = tosa.reshape %arg73 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %353 = tosa.add %349, %352 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %cst_115 = arith.constant dense<3.000000e+00> : tensor<1x240x14x14xf32>
    %354 = tosa.add %353, %cst_115 : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %355 = tosa.clamp %354 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %356 = tosa.clamp %355 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %357 = tosa.mul %353, %356 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_116 = arith.constant dense<6.000000e+00> : tensor<1x240x14x14xf32>
    %cst_117 = arith.constant dense<0.166666672> : tensor<1x240x14x14xf32>
    %358 = tosa.mul %357, %cst_117 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_118 = arith.constant dense<0.000000e+00> : tensor<240xf32>
    %cst_119 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %359 = tosa.transpose %358, %cst_119 : (tensor<1x240x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x240xf32>
    %cst_120 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %360 = tosa.transpose %arg74, %cst_120 : (tensor<240x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x240x1xf32>
    %361 = tosa.depthwise_conv2d %359, %360, %cst_118 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x14x14x240xf32>, tensor<5x5x240x1xf32>, tensor<240xf32>) -> tensor<1x14x14x240xf32>
    %cst_121 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %362 = tosa.transpose %361, %cst_121 : (tensor<1x14x14x240xf32>, tensor<4xi32>) -> tensor<1x240x14x14xf32>
    %cst_122 = arith.constant dense<1.000000e-03> : tensor<240xf32>
    %363 = tosa.add %arg76, %cst_122 : (tensor<240xf32>, tensor<240xf32>) -> tensor<240xf32>
    %364 = math.sqrt %363 : tensor<240xf32>
    %365 = tosa.reciprocal %364 : (tensor<240xf32>) -> tensor<240xf32>
    %cst_123 = arith.constant dense<1.000000e+00> : tensor<240xf32>
    %366 = tosa.reshape %arg75 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %367 = tosa.reshape %arg75 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %368 = tosa.reshape %365 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %369 = tosa.reshape %365 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %370 = tosa.reshape %arg75 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %371 = tosa.sub %362, %370 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %372 = tosa.reshape %365 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %373 = tosa.mul %371, %372 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %374 = tosa.reshape %arg77 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %375 = tosa.reshape %arg77 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %376 = tosa.reshape %arg77 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %377 = tosa.mul %373, %376 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %378 = tosa.reshape %arg78 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %379 = tosa.reshape %arg78 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %380 = tosa.reshape %arg78 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %381 = tosa.add %377, %380 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %cst_124 = arith.constant dense<3.000000e+00> : tensor<1x240x14x14xf32>
    %382 = tosa.add %381, %cst_124 : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %383 = tosa.clamp %382 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %384 = tosa.clamp %383 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %385 = tosa.mul %381, %384 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_125 = arith.constant dense<6.000000e+00> : tensor<1x240x14x14xf32>
    %cst_126 = arith.constant dense<0.166666672> : tensor<1x240x14x14xf32>
    %386 = tosa.mul %385, %cst_126 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %387 = tosa.reduce_sum %386 {axis = 3 : i32} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x1xf32>
    %388 = tosa.reduce_sum %387 {axis = 2 : i32} : (tensor<1x240x14x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_127 = arith.constant dense<1.960000e+02> : tensor<1xf32>
    %cst_128 = arith.constant dense<0.00510204071> : tensor<1xf32>
    %389 = tosa.mul %cst_128, %388 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_129 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %390 = tosa.transpose %389, %cst_129 : (tensor<1x240x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x240xf32>
    %cst_130 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %391 = tosa.transpose %arg79, %cst_130 : (tensor<64x240x1x1xf32>, tensor<4xi32>) -> tensor<64x1x1x240xf32>
    %392 = tosa.conv2d %390, %391, %arg80 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x240xf32>, tensor<64x1x1x240xf32>, tensor<64xf32>) -> tensor<1x1x1x64xf32>
    %cst_131 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %393 = tosa.transpose %392, %cst_131 : (tensor<1x1x1x64xf32>, tensor<4xi32>) -> tensor<1x64x1x1xf32>
    %cst_132 = arith.constant dense<0.000000e+00> : tensor<1x64x1x1xf32>
    %394 = tosa.maximum %393, %cst_132 : (tensor<1x64x1x1xf32>, tensor<1x64x1x1xf32>) -> tensor<1x64x1x1xf32>
    %cst_133 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %395 = tosa.transpose %394, %cst_133 : (tensor<1x64x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x64xf32>
    %cst_134 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %396 = tosa.transpose %arg81, %cst_134 : (tensor<240x64x1x1xf32>, tensor<4xi32>) -> tensor<240x1x1x64xf32>
    %397 = tosa.conv2d %395, %396, %arg82 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x64xf32>, tensor<240x1x1x64xf32>, tensor<240xf32>) -> tensor<1x1x1x240xf32>
    %cst_135 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %398 = tosa.transpose %397, %cst_135 : (tensor<1x1x1x240xf32>, tensor<4xi32>) -> tensor<1x240x1x1xf32>
    %cst_136 = arith.constant dense<3.000000e+00> : tensor<1x240x1x1xf32>
    %399 = tosa.add %398, %cst_136 : (tensor<1x240x1x1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %400 = tosa.clamp %399 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %401 = tosa.clamp %400 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_137 = arith.constant dense<6.000000e+00> : tensor<1x240x1x1xf32>
    %cst_138 = arith.constant dense<0.166666672> : tensor<1x240x1x1xf32>
    %402 = tosa.mul %401, %cst_138 {shift = 0 : i8} : (tensor<1x240x1x1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %403 = tosa.mul %402, %386 {shift = 0 : i8} : (tensor<1x240x1x1xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_139 = arith.constant dense<0.000000e+00> : tensor<40xf32>
    %cst_140 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %404 = tosa.transpose %403, %cst_140 : (tensor<1x240x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x240xf32>
    %cst_141 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %405 = tosa.transpose %arg83, %cst_141 : (tensor<40x240x1x1xf32>, tensor<4xi32>) -> tensor<40x1x1x240xf32>
    %406 = tosa.conv2d %404, %405, %cst_139 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x240xf32>, tensor<40x1x1x240xf32>, tensor<40xf32>) -> tensor<1x14x14x40xf32>
    %cst_142 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %407 = tosa.transpose %406, %cst_142 : (tensor<1x14x14x40xf32>, tensor<4xi32>) -> tensor<1x40x14x14xf32>
    %cst_143 = arith.constant dense<1.000000e-03> : tensor<40xf32>
    %408 = tosa.add %arg85, %cst_143 : (tensor<40xf32>, tensor<40xf32>) -> tensor<40xf32>
    %409 = math.sqrt %408 : tensor<40xf32>
    %410 = tosa.reciprocal %409 : (tensor<40xf32>) -> tensor<40xf32>
    %cst_144 = arith.constant dense<1.000000e+00> : tensor<40xf32>
    %411 = tosa.reshape %arg84 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %412 = tosa.reshape %arg84 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %413 = tosa.reshape %410 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %414 = tosa.reshape %410 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %415 = tosa.reshape %arg84 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %416 = tosa.sub %407, %415 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %417 = tosa.reshape %410 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %418 = tosa.mul %416, %417 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %419 = tosa.reshape %arg86 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %420 = tosa.reshape %arg86 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %421 = tosa.reshape %arg86 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %422 = tosa.mul %418, %421 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %423 = tosa.reshape %arg87 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %424 = tosa.reshape %arg87 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %425 = tosa.reshape %arg87 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %426 = tosa.add %422, %425 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %427 = tosa.add %426, %330 : (tensor<1x40x14x14xf32>, tensor<1x40x14x14xf32>) -> tensor<1x40x14x14xf32>
    %cst_145 = arith.constant dense<0.000000e+00> : tensor<240xf32>
    %cst_146 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %428 = tosa.transpose %427, %cst_146 : (tensor<1x40x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x40xf32>
    %cst_147 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %429 = tosa.transpose %arg88, %cst_147 : (tensor<240x40x1x1xf32>, tensor<4xi32>) -> tensor<240x1x1x40xf32>
    %430 = tosa.conv2d %428, %429, %cst_145 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x40xf32>, tensor<240x1x1x40xf32>, tensor<240xf32>) -> tensor<1x14x14x240xf32>
    %cst_148 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %431 = tosa.transpose %430, %cst_148 : (tensor<1x14x14x240xf32>, tensor<4xi32>) -> tensor<1x240x14x14xf32>
    %cst_149 = arith.constant dense<1.000000e-03> : tensor<240xf32>
    %432 = tosa.add %arg90, %cst_149 : (tensor<240xf32>, tensor<240xf32>) -> tensor<240xf32>
    %433 = math.sqrt %432 : tensor<240xf32>
    %434 = tosa.reciprocal %433 : (tensor<240xf32>) -> tensor<240xf32>
    %cst_150 = arith.constant dense<1.000000e+00> : tensor<240xf32>
    %435 = tosa.reshape %arg89 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %436 = tosa.reshape %arg89 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %437 = tosa.reshape %434 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %438 = tosa.reshape %434 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %439 = tosa.reshape %arg89 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %440 = tosa.sub %431, %439 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %441 = tosa.reshape %434 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %442 = tosa.mul %440, %441 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %443 = tosa.reshape %arg91 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %444 = tosa.reshape %arg91 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %445 = tosa.reshape %arg91 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %446 = tosa.mul %442, %445 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %447 = tosa.reshape %arg92 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %448 = tosa.reshape %arg92 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %449 = tosa.reshape %arg92 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %450 = tosa.add %446, %449 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %cst_151 = arith.constant dense<3.000000e+00> : tensor<1x240x14x14xf32>
    %451 = tosa.add %450, %cst_151 : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %452 = tosa.clamp %451 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %453 = tosa.clamp %452 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %454 = tosa.mul %450, %453 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_152 = arith.constant dense<6.000000e+00> : tensor<1x240x14x14xf32>
    %cst_153 = arith.constant dense<0.166666672> : tensor<1x240x14x14xf32>
    %455 = tosa.mul %454, %cst_153 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_154 = arith.constant dense<0.000000e+00> : tensor<240xf32>
    %cst_155 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %456 = tosa.transpose %455, %cst_155 : (tensor<1x240x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x240xf32>
    %cst_156 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %457 = tosa.transpose %arg93, %cst_156 : (tensor<240x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x240x1xf32>
    %458 = tosa.depthwise_conv2d %456, %457, %cst_154 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x14x14x240xf32>, tensor<5x5x240x1xf32>, tensor<240xf32>) -> tensor<1x14x14x240xf32>
    %cst_157 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %459 = tosa.transpose %458, %cst_157 : (tensor<1x14x14x240xf32>, tensor<4xi32>) -> tensor<1x240x14x14xf32>
    %cst_158 = arith.constant dense<1.000000e-03> : tensor<240xf32>
    %460 = tosa.add %arg95, %cst_158 : (tensor<240xf32>, tensor<240xf32>) -> tensor<240xf32>
    %461 = math.sqrt %460 : tensor<240xf32>
    %462 = tosa.reciprocal %461 : (tensor<240xf32>) -> tensor<240xf32>
    %cst_159 = arith.constant dense<1.000000e+00> : tensor<240xf32>
    %463 = tosa.reshape %arg94 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %464 = tosa.reshape %arg94 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %465 = tosa.reshape %462 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %466 = tosa.reshape %462 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %467 = tosa.reshape %arg94 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %468 = tosa.sub %459, %467 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %469 = tosa.reshape %462 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %470 = tosa.mul %468, %469 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %471 = tosa.reshape %arg96 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %472 = tosa.reshape %arg96 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %473 = tosa.reshape %arg96 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %474 = tosa.mul %470, %473 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %475 = tosa.reshape %arg97 {new_shape = array<i64: 240, 1>} : (tensor<240xf32>) -> tensor<240x1xf32>
    %476 = tosa.reshape %arg97 {new_shape = array<i64: 240, 1, 1>} : (tensor<240xf32>) -> tensor<240x1x1xf32>
    %477 = tosa.reshape %arg97 {new_shape = array<i64: 1, 240, 1, 1>} : (tensor<240xf32>) -> tensor<1x240x1x1xf32>
    %478 = tosa.add %474, %477 : (tensor<1x240x14x14xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x14x14xf32>
    %cst_160 = arith.constant dense<3.000000e+00> : tensor<1x240x14x14xf32>
    %479 = tosa.add %478, %cst_160 : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %480 = tosa.clamp %479 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %481 = tosa.clamp %480 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %482 = tosa.mul %478, %481 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_161 = arith.constant dense<6.000000e+00> : tensor<1x240x14x14xf32>
    %cst_162 = arith.constant dense<0.166666672> : tensor<1x240x14x14xf32>
    %483 = tosa.mul %482, %cst_162 {shift = 0 : i8} : (tensor<1x240x14x14xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %484 = tosa.reduce_sum %483 {axis = 3 : i32} : (tensor<1x240x14x14xf32>) -> tensor<1x240x14x1xf32>
    %485 = tosa.reduce_sum %484 {axis = 2 : i32} : (tensor<1x240x14x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_163 = arith.constant dense<1.960000e+02> : tensor<1xf32>
    %cst_164 = arith.constant dense<0.00510204071> : tensor<1xf32>
    %486 = tosa.mul %cst_164, %485 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_165 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %487 = tosa.transpose %486, %cst_165 : (tensor<1x240x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x240xf32>
    %cst_166 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %488 = tosa.transpose %arg98, %cst_166 : (tensor<64x240x1x1xf32>, tensor<4xi32>) -> tensor<64x1x1x240xf32>
    %489 = tosa.conv2d %487, %488, %arg99 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x240xf32>, tensor<64x1x1x240xf32>, tensor<64xf32>) -> tensor<1x1x1x64xf32>
    %cst_167 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %490 = tosa.transpose %489, %cst_167 : (tensor<1x1x1x64xf32>, tensor<4xi32>) -> tensor<1x64x1x1xf32>
    %cst_168 = arith.constant dense<0.000000e+00> : tensor<1x64x1x1xf32>
    %491 = tosa.maximum %490, %cst_168 : (tensor<1x64x1x1xf32>, tensor<1x64x1x1xf32>) -> tensor<1x64x1x1xf32>
    %cst_169 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %492 = tosa.transpose %491, %cst_169 : (tensor<1x64x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x64xf32>
    %cst_170 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %493 = tosa.transpose %arg100, %cst_170 : (tensor<240x64x1x1xf32>, tensor<4xi32>) -> tensor<240x1x1x64xf32>
    %494 = tosa.conv2d %492, %493, %arg101 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x64xf32>, tensor<240x1x1x64xf32>, tensor<240xf32>) -> tensor<1x1x1x240xf32>
    %cst_171 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %495 = tosa.transpose %494, %cst_171 : (tensor<1x1x1x240xf32>, tensor<4xi32>) -> tensor<1x240x1x1xf32>
    %cst_172 = arith.constant dense<3.000000e+00> : tensor<1x240x1x1xf32>
    %496 = tosa.add %495, %cst_172 : (tensor<1x240x1x1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %497 = tosa.clamp %496 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %498 = tosa.clamp %497 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %cst_173 = arith.constant dense<6.000000e+00> : tensor<1x240x1x1xf32>
    %cst_174 = arith.constant dense<0.166666672> : tensor<1x240x1x1xf32>
    %499 = tosa.mul %498, %cst_174 {shift = 0 : i8} : (tensor<1x240x1x1xf32>, tensor<1x240x1x1xf32>) -> tensor<1x240x1x1xf32>
    %500 = tosa.mul %499, %483 {shift = 0 : i8} : (tensor<1x240x1x1xf32>, tensor<1x240x14x14xf32>) -> tensor<1x240x14x14xf32>
    %cst_175 = arith.constant dense<0.000000e+00> : tensor<40xf32>
    %cst_176 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %501 = tosa.transpose %500, %cst_176 : (tensor<1x240x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x240xf32>
    %cst_177 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %502 = tosa.transpose %arg102, %cst_177 : (tensor<40x240x1x1xf32>, tensor<4xi32>) -> tensor<40x1x1x240xf32>
    %503 = tosa.conv2d %501, %502, %cst_175 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x240xf32>, tensor<40x1x1x240xf32>, tensor<40xf32>) -> tensor<1x14x14x40xf32>
    %cst_178 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %504 = tosa.transpose %503, %cst_178 : (tensor<1x14x14x40xf32>, tensor<4xi32>) -> tensor<1x40x14x14xf32>
    %cst_179 = arith.constant dense<1.000000e-03> : tensor<40xf32>
    %505 = tosa.add %arg104, %cst_179 : (tensor<40xf32>, tensor<40xf32>) -> tensor<40xf32>
    %506 = math.sqrt %505 : tensor<40xf32>
    %507 = tosa.reciprocal %506 : (tensor<40xf32>) -> tensor<40xf32>
    %cst_180 = arith.constant dense<1.000000e+00> : tensor<40xf32>
    %508 = tosa.reshape %arg103 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %509 = tosa.reshape %arg103 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %510 = tosa.reshape %507 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %511 = tosa.reshape %507 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %512 = tosa.reshape %arg103 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %513 = tosa.sub %504, %512 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %514 = tosa.reshape %507 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %515 = tosa.mul %513, %514 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %516 = tosa.reshape %arg105 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %517 = tosa.reshape %arg105 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %518 = tosa.reshape %arg105 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %519 = tosa.mul %515, %518 {shift = 0 : i8} : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %520 = tosa.reshape %arg106 {new_shape = array<i64: 40, 1>} : (tensor<40xf32>) -> tensor<40x1xf32>
    %521 = tosa.reshape %arg106 {new_shape = array<i64: 40, 1, 1>} : (tensor<40xf32>) -> tensor<40x1x1xf32>
    %522 = tosa.reshape %arg106 {new_shape = array<i64: 1, 40, 1, 1>} : (tensor<40xf32>) -> tensor<1x40x1x1xf32>
    %523 = tosa.add %519, %522 : (tensor<1x40x14x14xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x14x14xf32>
    %524 = tosa.add %523, %427 : (tensor<1x40x14x14xf32>, tensor<1x40x14x14xf32>) -> tensor<1x40x14x14xf32>
    %cst_181 = arith.constant dense<0.000000e+00> : tensor<120xf32>
    %cst_182 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %525 = tosa.transpose %524, %cst_182 : (tensor<1x40x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x40xf32>
    %cst_183 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %526 = tosa.transpose %arg107, %cst_183 : (tensor<120x40x1x1xf32>, tensor<4xi32>) -> tensor<120x1x1x40xf32>
    %527 = tosa.conv2d %525, %526, %cst_181 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x40xf32>, tensor<120x1x1x40xf32>, tensor<120xf32>) -> tensor<1x14x14x120xf32>
    %cst_184 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %528 = tosa.transpose %527, %cst_184 : (tensor<1x14x14x120xf32>, tensor<4xi32>) -> tensor<1x120x14x14xf32>
    %cst_185 = arith.constant dense<1.000000e-03> : tensor<120xf32>
    %529 = tosa.add %arg109, %cst_185 : (tensor<120xf32>, tensor<120xf32>) -> tensor<120xf32>
    %530 = math.sqrt %529 : tensor<120xf32>
    %531 = tosa.reciprocal %530 : (tensor<120xf32>) -> tensor<120xf32>
    %cst_186 = arith.constant dense<1.000000e+00> : tensor<120xf32>
    %532 = tosa.reshape %arg108 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %533 = tosa.reshape %arg108 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %534 = tosa.reshape %531 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %535 = tosa.reshape %531 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %536 = tosa.reshape %arg108 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %537 = tosa.sub %528, %536 : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %538 = tosa.reshape %531 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %539 = tosa.mul %537, %538 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %540 = tosa.reshape %arg110 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %541 = tosa.reshape %arg110 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %542 = tosa.reshape %arg110 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %543 = tosa.mul %539, %542 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %544 = tosa.reshape %arg111 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %545 = tosa.reshape %arg111 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %546 = tosa.reshape %arg111 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %547 = tosa.add %543, %546 : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %cst_187 = arith.constant dense<3.000000e+00> : tensor<1x120x14x14xf32>
    %548 = tosa.add %547, %cst_187 : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %549 = tosa.clamp %548 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %550 = tosa.clamp %549 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %551 = tosa.mul %547, %550 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %cst_188 = arith.constant dense<6.000000e+00> : tensor<1x120x14x14xf32>
    %cst_189 = arith.constant dense<0.166666672> : tensor<1x120x14x14xf32>
    %552 = tosa.mul %551, %cst_189 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %cst_190 = arith.constant dense<0.000000e+00> : tensor<120xf32>
    %cst_191 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %553 = tosa.transpose %552, %cst_191 : (tensor<1x120x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x120xf32>
    %cst_192 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %554 = tosa.transpose %arg112, %cst_192 : (tensor<120x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x120x1xf32>
    %555 = tosa.depthwise_conv2d %553, %554, %cst_190 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x14x14x120xf32>, tensor<5x5x120x1xf32>, tensor<120xf32>) -> tensor<1x14x14x120xf32>
    %cst_193 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %556 = tosa.transpose %555, %cst_193 : (tensor<1x14x14x120xf32>, tensor<4xi32>) -> tensor<1x120x14x14xf32>
    %cst_194 = arith.constant dense<1.000000e-03> : tensor<120xf32>
    %557 = tosa.add %arg114, %cst_194 : (tensor<120xf32>, tensor<120xf32>) -> tensor<120xf32>
    %558 = math.sqrt %557 : tensor<120xf32>
    %559 = tosa.reciprocal %558 : (tensor<120xf32>) -> tensor<120xf32>
    %cst_195 = arith.constant dense<1.000000e+00> : tensor<120xf32>
    %560 = tosa.reshape %arg113 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %561 = tosa.reshape %arg113 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %562 = tosa.reshape %559 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %563 = tosa.reshape %559 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %564 = tosa.reshape %arg113 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %565 = tosa.sub %556, %564 : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %566 = tosa.reshape %559 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %567 = tosa.mul %565, %566 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %568 = tosa.reshape %arg115 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %569 = tosa.reshape %arg115 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %570 = tosa.reshape %arg115 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %571 = tosa.mul %567, %570 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %572 = tosa.reshape %arg116 {new_shape = array<i64: 120, 1>} : (tensor<120xf32>) -> tensor<120x1xf32>
    %573 = tosa.reshape %arg116 {new_shape = array<i64: 120, 1, 1>} : (tensor<120xf32>) -> tensor<120x1x1xf32>
    %574 = tosa.reshape %arg116 {new_shape = array<i64: 1, 120, 1, 1>} : (tensor<120xf32>) -> tensor<1x120x1x1xf32>
    %575 = tosa.add %571, %574 : (tensor<1x120x14x14xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x14x14xf32>
    %cst_196 = arith.constant dense<3.000000e+00> : tensor<1x120x14x14xf32>
    %576 = tosa.add %575, %cst_196 : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %577 = tosa.clamp %576 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %578 = tosa.clamp %577 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %579 = tosa.mul %575, %578 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %cst_197 = arith.constant dense<6.000000e+00> : tensor<1x120x14x14xf32>
    %cst_198 = arith.constant dense<0.166666672> : tensor<1x120x14x14xf32>
    %580 = tosa.mul %579, %cst_198 {shift = 0 : i8} : (tensor<1x120x14x14xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %581 = tosa.reduce_sum %580 {axis = 3 : i32} : (tensor<1x120x14x14xf32>) -> tensor<1x120x14x1xf32>
    %582 = tosa.reduce_sum %581 {axis = 2 : i32} : (tensor<1x120x14x1xf32>) -> tensor<1x120x1x1xf32>
    %cst_199 = arith.constant dense<1.960000e+02> : tensor<1xf32>
    %cst_200 = arith.constant dense<0.00510204071> : tensor<1xf32>
    %583 = tosa.mul %cst_200, %582 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x1x1xf32>
    %cst_201 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %584 = tosa.transpose %583, %cst_201 : (tensor<1x120x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x120xf32>
    %cst_202 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %585 = tosa.transpose %arg117, %cst_202 : (tensor<32x120x1x1xf32>, tensor<4xi32>) -> tensor<32x1x1x120xf32>
    %586 = tosa.conv2d %584, %585, %arg118 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x120xf32>, tensor<32x1x1x120xf32>, tensor<32xf32>) -> tensor<1x1x1x32xf32>
    %cst_203 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %587 = tosa.transpose %586, %cst_203 : (tensor<1x1x1x32xf32>, tensor<4xi32>) -> tensor<1x32x1x1xf32>
    %cst_204 = arith.constant dense<0.000000e+00> : tensor<1x32x1x1xf32>
    %588 = tosa.maximum %587, %cst_204 : (tensor<1x32x1x1xf32>, tensor<1x32x1x1xf32>) -> tensor<1x32x1x1xf32>
    %cst_205 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %589 = tosa.transpose %588, %cst_205 : (tensor<1x32x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x32xf32>
    %cst_206 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %590 = tosa.transpose %arg119, %cst_206 : (tensor<120x32x1x1xf32>, tensor<4xi32>) -> tensor<120x1x1x32xf32>
    %591 = tosa.conv2d %589, %590, %arg120 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x32xf32>, tensor<120x1x1x32xf32>, tensor<120xf32>) -> tensor<1x1x1x120xf32>
    %cst_207 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %592 = tosa.transpose %591, %cst_207 : (tensor<1x1x1x120xf32>, tensor<4xi32>) -> tensor<1x120x1x1xf32>
    %cst_208 = arith.constant dense<3.000000e+00> : tensor<1x120x1x1xf32>
    %593 = tosa.add %592, %cst_208 : (tensor<1x120x1x1xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x1x1xf32>
    %594 = tosa.clamp %593 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x120x1x1xf32>) -> tensor<1x120x1x1xf32>
    %595 = tosa.clamp %594 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x120x1x1xf32>) -> tensor<1x120x1x1xf32>
    %cst_209 = arith.constant dense<6.000000e+00> : tensor<1x120x1x1xf32>
    %cst_210 = arith.constant dense<0.166666672> : tensor<1x120x1x1xf32>
    %596 = tosa.mul %595, %cst_210 {shift = 0 : i8} : (tensor<1x120x1x1xf32>, tensor<1x120x1x1xf32>) -> tensor<1x120x1x1xf32>
    %597 = tosa.mul %596, %580 {shift = 0 : i8} : (tensor<1x120x1x1xf32>, tensor<1x120x14x14xf32>) -> tensor<1x120x14x14xf32>
    %cst_211 = arith.constant dense<0.000000e+00> : tensor<48xf32>
    %cst_212 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %598 = tosa.transpose %597, %cst_212 : (tensor<1x120x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x120xf32>
    %cst_213 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %599 = tosa.transpose %arg121, %cst_213 : (tensor<48x120x1x1xf32>, tensor<4xi32>) -> tensor<48x1x1x120xf32>
    %600 = tosa.conv2d %598, %599, %cst_211 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x120xf32>, tensor<48x1x1x120xf32>, tensor<48xf32>) -> tensor<1x14x14x48xf32>
    %cst_214 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %601 = tosa.transpose %600, %cst_214 : (tensor<1x14x14x48xf32>, tensor<4xi32>) -> tensor<1x48x14x14xf32>
    %cst_215 = arith.constant dense<1.000000e-03> : tensor<48xf32>
    %602 = tosa.add %arg123, %cst_215 : (tensor<48xf32>, tensor<48xf32>) -> tensor<48xf32>
    %603 = math.sqrt %602 : tensor<48xf32>
    %604 = tosa.reciprocal %603 : (tensor<48xf32>) -> tensor<48xf32>
    %cst_216 = arith.constant dense<1.000000e+00> : tensor<48xf32>
    %605 = tosa.reshape %arg122 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %606 = tosa.reshape %arg122 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %607 = tosa.reshape %604 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %608 = tosa.reshape %604 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %609 = tosa.reshape %arg122 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %610 = tosa.sub %601, %609 : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %611 = tosa.reshape %604 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %612 = tosa.mul %610, %611 {shift = 0 : i8} : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %613 = tosa.reshape %arg124 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %614 = tosa.reshape %arg124 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %615 = tosa.reshape %arg124 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %616 = tosa.mul %612, %615 {shift = 0 : i8} : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %617 = tosa.reshape %arg125 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %618 = tosa.reshape %arg125 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %619 = tosa.reshape %arg125 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %620 = tosa.add %616, %619 : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %cst_217 = arith.constant dense<0.000000e+00> : tensor<144xf32>
    %cst_218 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %621 = tosa.transpose %620, %cst_218 : (tensor<1x48x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x48xf32>
    %cst_219 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %622 = tosa.transpose %arg126, %cst_219 : (tensor<144x48x1x1xf32>, tensor<4xi32>) -> tensor<144x1x1x48xf32>
    %623 = tosa.conv2d %621, %622, %cst_217 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x48xf32>, tensor<144x1x1x48xf32>, tensor<144xf32>) -> tensor<1x14x14x144xf32>
    %cst_220 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %624 = tosa.transpose %623, %cst_220 : (tensor<1x14x14x144xf32>, tensor<4xi32>) -> tensor<1x144x14x14xf32>
    %cst_221 = arith.constant dense<1.000000e-03> : tensor<144xf32>
    %625 = tosa.add %arg128, %cst_221 : (tensor<144xf32>, tensor<144xf32>) -> tensor<144xf32>
    %626 = math.sqrt %625 : tensor<144xf32>
    %627 = tosa.reciprocal %626 : (tensor<144xf32>) -> tensor<144xf32>
    %cst_222 = arith.constant dense<1.000000e+00> : tensor<144xf32>
    %628 = tosa.reshape %arg127 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %629 = tosa.reshape %arg127 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %630 = tosa.reshape %627 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %631 = tosa.reshape %627 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %632 = tosa.reshape %arg127 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %633 = tosa.sub %624, %632 : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %634 = tosa.reshape %627 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %635 = tosa.mul %633, %634 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %636 = tosa.reshape %arg129 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %637 = tosa.reshape %arg129 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %638 = tosa.reshape %arg129 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %639 = tosa.mul %635, %638 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %640 = tosa.reshape %arg130 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %641 = tosa.reshape %arg130 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %642 = tosa.reshape %arg130 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %643 = tosa.add %639, %642 : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %cst_223 = arith.constant dense<3.000000e+00> : tensor<1x144x14x14xf32>
    %644 = tosa.add %643, %cst_223 : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %645 = tosa.clamp %644 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %646 = tosa.clamp %645 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %647 = tosa.mul %643, %646 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %cst_224 = arith.constant dense<6.000000e+00> : tensor<1x144x14x14xf32>
    %cst_225 = arith.constant dense<0.166666672> : tensor<1x144x14x14xf32>
    %648 = tosa.mul %647, %cst_225 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %cst_226 = arith.constant dense<0.000000e+00> : tensor<144xf32>
    %cst_227 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %649 = tosa.transpose %648, %cst_227 : (tensor<1x144x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x144xf32>
    %cst_228 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %650 = tosa.transpose %arg131, %cst_228 : (tensor<144x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x144x1xf32>
    %651 = tosa.depthwise_conv2d %649, %650, %cst_226 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x14x14x144xf32>, tensor<5x5x144x1xf32>, tensor<144xf32>) -> tensor<1x14x14x144xf32>
    %cst_229 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %652 = tosa.transpose %651, %cst_229 : (tensor<1x14x14x144xf32>, tensor<4xi32>) -> tensor<1x144x14x14xf32>
    %cst_230 = arith.constant dense<1.000000e-03> : tensor<144xf32>
    %653 = tosa.add %arg133, %cst_230 : (tensor<144xf32>, tensor<144xf32>) -> tensor<144xf32>
    %654 = math.sqrt %653 : tensor<144xf32>
    %655 = tosa.reciprocal %654 : (tensor<144xf32>) -> tensor<144xf32>
    %cst_231 = arith.constant dense<1.000000e+00> : tensor<144xf32>
    %656 = tosa.reshape %arg132 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %657 = tosa.reshape %arg132 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %658 = tosa.reshape %655 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %659 = tosa.reshape %655 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %660 = tosa.reshape %arg132 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %661 = tosa.sub %652, %660 : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %662 = tosa.reshape %655 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %663 = tosa.mul %661, %662 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %664 = tosa.reshape %arg134 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %665 = tosa.reshape %arg134 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %666 = tosa.reshape %arg134 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %667 = tosa.mul %663, %666 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %668 = tosa.reshape %arg135 {new_shape = array<i64: 144, 1>} : (tensor<144xf32>) -> tensor<144x1xf32>
    %669 = tosa.reshape %arg135 {new_shape = array<i64: 144, 1, 1>} : (tensor<144xf32>) -> tensor<144x1x1xf32>
    %670 = tosa.reshape %arg135 {new_shape = array<i64: 1, 144, 1, 1>} : (tensor<144xf32>) -> tensor<1x144x1x1xf32>
    %671 = tosa.add %667, %670 : (tensor<1x144x14x14xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x14x14xf32>
    %cst_232 = arith.constant dense<3.000000e+00> : tensor<1x144x14x14xf32>
    %672 = tosa.add %671, %cst_232 : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %673 = tosa.clamp %672 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %674 = tosa.clamp %673 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %675 = tosa.mul %671, %674 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %cst_233 = arith.constant dense<6.000000e+00> : tensor<1x144x14x14xf32>
    %cst_234 = arith.constant dense<0.166666672> : tensor<1x144x14x14xf32>
    %676 = tosa.mul %675, %cst_234 {shift = 0 : i8} : (tensor<1x144x14x14xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %677 = tosa.reduce_sum %676 {axis = 3 : i32} : (tensor<1x144x14x14xf32>) -> tensor<1x144x14x1xf32>
    %678 = tosa.reduce_sum %677 {axis = 2 : i32} : (tensor<1x144x14x1xf32>) -> tensor<1x144x1x1xf32>
    %cst_235 = arith.constant dense<1.960000e+02> : tensor<1xf32>
    %cst_236 = arith.constant dense<0.00510204071> : tensor<1xf32>
    %679 = tosa.mul %cst_236, %678 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %cst_237 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %680 = tosa.transpose %679, %cst_237 : (tensor<1x144x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x144xf32>
    %cst_238 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %681 = tosa.transpose %arg136, %cst_238 : (tensor<40x144x1x1xf32>, tensor<4xi32>) -> tensor<40x1x1x144xf32>
    %682 = tosa.conv2d %680, %681, %arg137 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x144xf32>, tensor<40x1x1x144xf32>, tensor<40xf32>) -> tensor<1x1x1x40xf32>
    %cst_239 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %683 = tosa.transpose %682, %cst_239 : (tensor<1x1x1x40xf32>, tensor<4xi32>) -> tensor<1x40x1x1xf32>
    %cst_240 = arith.constant dense<0.000000e+00> : tensor<1x40x1x1xf32>
    %684 = tosa.maximum %683, %cst_240 : (tensor<1x40x1x1xf32>, tensor<1x40x1x1xf32>) -> tensor<1x40x1x1xf32>
    %cst_241 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %685 = tosa.transpose %684, %cst_241 : (tensor<1x40x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x40xf32>
    %cst_242 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %686 = tosa.transpose %arg138, %cst_242 : (tensor<144x40x1x1xf32>, tensor<4xi32>) -> tensor<144x1x1x40xf32>
    %687 = tosa.conv2d %685, %686, %arg139 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x40xf32>, tensor<144x1x1x40xf32>, tensor<144xf32>) -> tensor<1x1x1x144xf32>
    %cst_243 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %688 = tosa.transpose %687, %cst_243 : (tensor<1x1x1x144xf32>, tensor<4xi32>) -> tensor<1x144x1x1xf32>
    %cst_244 = arith.constant dense<3.000000e+00> : tensor<1x144x1x1xf32>
    %689 = tosa.add %688, %cst_244 : (tensor<1x144x1x1xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %690 = tosa.clamp %689 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %691 = tosa.clamp %690 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %cst_245 = arith.constant dense<6.000000e+00> : tensor<1x144x1x1xf32>
    %cst_246 = arith.constant dense<0.166666672> : tensor<1x144x1x1xf32>
    %692 = tosa.mul %691, %cst_246 {shift = 0 : i8} : (tensor<1x144x1x1xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %693 = tosa.mul %692, %676 {shift = 0 : i8} : (tensor<1x144x1x1xf32>, tensor<1x144x14x14xf32>) -> tensor<1x144x14x14xf32>
    %cst_247 = arith.constant dense<0.000000e+00> : tensor<48xf32>
    %cst_248 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %694 = tosa.transpose %693, %cst_248 : (tensor<1x144x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x144xf32>
    %cst_249 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %695 = tosa.transpose %arg140, %cst_249 : (tensor<48x144x1x1xf32>, tensor<4xi32>) -> tensor<48x1x1x144xf32>
    %696 = tosa.conv2d %694, %695, %cst_247 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x144xf32>, tensor<48x1x1x144xf32>, tensor<48xf32>) -> tensor<1x14x14x48xf32>
    %cst_250 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %697 = tosa.transpose %696, %cst_250 : (tensor<1x14x14x48xf32>, tensor<4xi32>) -> tensor<1x48x14x14xf32>
    %cst_251 = arith.constant dense<1.000000e-03> : tensor<48xf32>
    %698 = tosa.add %arg142, %cst_251 : (tensor<48xf32>, tensor<48xf32>) -> tensor<48xf32>
    %699 = math.sqrt %698 : tensor<48xf32>
    %700 = tosa.reciprocal %699 : (tensor<48xf32>) -> tensor<48xf32>
    %cst_252 = arith.constant dense<1.000000e+00> : tensor<48xf32>
    %701 = tosa.reshape %arg141 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %702 = tosa.reshape %arg141 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %703 = tosa.reshape %700 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %704 = tosa.reshape %700 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %705 = tosa.reshape %arg141 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %706 = tosa.sub %697, %705 : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %707 = tosa.reshape %700 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %708 = tosa.mul %706, %707 {shift = 0 : i8} : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %709 = tosa.reshape %arg143 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %710 = tosa.reshape %arg143 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %711 = tosa.reshape %arg143 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %712 = tosa.mul %708, %711 {shift = 0 : i8} : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %713 = tosa.reshape %arg144 {new_shape = array<i64: 48, 1>} : (tensor<48xf32>) -> tensor<48x1xf32>
    %714 = tosa.reshape %arg144 {new_shape = array<i64: 48, 1, 1>} : (tensor<48xf32>) -> tensor<48x1x1xf32>
    %715 = tosa.reshape %arg144 {new_shape = array<i64: 1, 48, 1, 1>} : (tensor<48xf32>) -> tensor<1x48x1x1xf32>
    %716 = tosa.add %712, %715 : (tensor<1x48x14x14xf32>, tensor<1x48x1x1xf32>) -> tensor<1x48x14x14xf32>
    %717 = tosa.add %716, %620 : (tensor<1x48x14x14xf32>, tensor<1x48x14x14xf32>) -> tensor<1x48x14x14xf32>
    %cst_253 = arith.constant dense<0.000000e+00> : tensor<288xf32>
    %cst_254 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %718 = tosa.transpose %717, %cst_254 : (tensor<1x48x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x48xf32>
    %cst_255 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %719 = tosa.transpose %arg145, %cst_255 : (tensor<288x48x1x1xf32>, tensor<4xi32>) -> tensor<288x1x1x48xf32>
    %720 = tosa.conv2d %718, %719, %cst_253 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x48xf32>, tensor<288x1x1x48xf32>, tensor<288xf32>) -> tensor<1x14x14x288xf32>
    %cst_256 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %721 = tosa.transpose %720, %cst_256 : (tensor<1x14x14x288xf32>, tensor<4xi32>) -> tensor<1x288x14x14xf32>
    %cst_257 = arith.constant dense<1.000000e-03> : tensor<288xf32>
    %722 = tosa.add %arg147, %cst_257 : (tensor<288xf32>, tensor<288xf32>) -> tensor<288xf32>
    %723 = math.sqrt %722 : tensor<288xf32>
    %724 = tosa.reciprocal %723 : (tensor<288xf32>) -> tensor<288xf32>
    %cst_258 = arith.constant dense<1.000000e+00> : tensor<288xf32>
    %725 = tosa.reshape %arg146 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %726 = tosa.reshape %arg146 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %727 = tosa.reshape %724 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %728 = tosa.reshape %724 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %729 = tosa.reshape %arg146 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %730 = tosa.sub %721, %729 : (tensor<1x288x14x14xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x14x14xf32>
    %731 = tosa.reshape %724 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %732 = tosa.mul %730, %731 {shift = 0 : i8} : (tensor<1x288x14x14xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x14x14xf32>
    %733 = tosa.reshape %arg148 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %734 = tosa.reshape %arg148 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %735 = tosa.reshape %arg148 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %736 = tosa.mul %732, %735 {shift = 0 : i8} : (tensor<1x288x14x14xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x14x14xf32>
    %737 = tosa.reshape %arg149 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %738 = tosa.reshape %arg149 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %739 = tosa.reshape %arg149 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %740 = tosa.add %736, %739 : (tensor<1x288x14x14xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x14x14xf32>
    %cst_259 = arith.constant dense<3.000000e+00> : tensor<1x288x14x14xf32>
    %741 = tosa.add %740, %cst_259 : (tensor<1x288x14x14xf32>, tensor<1x288x14x14xf32>) -> tensor<1x288x14x14xf32>
    %742 = tosa.clamp %741 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x288x14x14xf32>) -> tensor<1x288x14x14xf32>
    %743 = tosa.clamp %742 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x288x14x14xf32>) -> tensor<1x288x14x14xf32>
    %744 = tosa.mul %740, %743 {shift = 0 : i8} : (tensor<1x288x14x14xf32>, tensor<1x288x14x14xf32>) -> tensor<1x288x14x14xf32>
    %cst_260 = arith.constant dense<6.000000e+00> : tensor<1x288x14x14xf32>
    %cst_261 = arith.constant dense<0.166666672> : tensor<1x288x14x14xf32>
    %745 = tosa.mul %744, %cst_261 {shift = 0 : i8} : (tensor<1x288x14x14xf32>, tensor<1x288x14x14xf32>) -> tensor<1x288x14x14xf32>
    %cst_262 = arith.constant dense<0.000000e+00> : tensor<288xf32>
    %cst_263 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %746 = tosa.transpose %745, %cst_263 : (tensor<1x288x14x14xf32>, tensor<4xi32>) -> tensor<1x14x14x288xf32>
    %cst_264 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %747 = tosa.transpose %arg150, %cst_264 : (tensor<288x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x288x1xf32>
    %748 = tosa.depthwise_conv2d %746, %747, %cst_262 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 2, 2>} : (tensor<1x14x14x288xf32>, tensor<5x5x288x1xf32>, tensor<288xf32>) -> tensor<1x7x7x288xf32>
    %cst_265 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %749 = tosa.transpose %748, %cst_265 : (tensor<1x7x7x288xf32>, tensor<4xi32>) -> tensor<1x288x7x7xf32>
    %cst_266 = arith.constant dense<1.000000e-03> : tensor<288xf32>
    %750 = tosa.add %arg152, %cst_266 : (tensor<288xf32>, tensor<288xf32>) -> tensor<288xf32>
    %751 = math.sqrt %750 : tensor<288xf32>
    %752 = tosa.reciprocal %751 : (tensor<288xf32>) -> tensor<288xf32>
    %cst_267 = arith.constant dense<1.000000e+00> : tensor<288xf32>
    %753 = tosa.reshape %arg151 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %754 = tosa.reshape %arg151 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %755 = tosa.reshape %752 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %756 = tosa.reshape %752 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %757 = tosa.reshape %arg151 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %758 = tosa.sub %749, %757 : (tensor<1x288x7x7xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x7x7xf32>
    %759 = tosa.reshape %752 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %760 = tosa.mul %758, %759 {shift = 0 : i8} : (tensor<1x288x7x7xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x7x7xf32>
    %761 = tosa.reshape %arg153 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %762 = tosa.reshape %arg153 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %763 = tosa.reshape %arg153 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %764 = tosa.mul %760, %763 {shift = 0 : i8} : (tensor<1x288x7x7xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x7x7xf32>
    %765 = tosa.reshape %arg154 {new_shape = array<i64: 288, 1>} : (tensor<288xf32>) -> tensor<288x1xf32>
    %766 = tosa.reshape %arg154 {new_shape = array<i64: 288, 1, 1>} : (tensor<288xf32>) -> tensor<288x1x1xf32>
    %767 = tosa.reshape %arg154 {new_shape = array<i64: 1, 288, 1, 1>} : (tensor<288xf32>) -> tensor<1x288x1x1xf32>
    %768 = tosa.add %764, %767 : (tensor<1x288x7x7xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x7x7xf32>
    %cst_268 = arith.constant dense<3.000000e+00> : tensor<1x288x7x7xf32>
    %769 = tosa.add %768, %cst_268 : (tensor<1x288x7x7xf32>, tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %770 = tosa.clamp %769 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %771 = tosa.clamp %770 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %772 = tosa.mul %768, %771 {shift = 0 : i8} : (tensor<1x288x7x7xf32>, tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %cst_269 = arith.constant dense<6.000000e+00> : tensor<1x288x7x7xf32>
    %cst_270 = arith.constant dense<0.166666672> : tensor<1x288x7x7xf32>
    %773 = tosa.mul %772, %cst_270 {shift = 0 : i8} : (tensor<1x288x7x7xf32>, tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %774 = tosa.reduce_sum %773 {axis = 3 : i32} : (tensor<1x288x7x7xf32>) -> tensor<1x288x7x1xf32>
    %775 = tosa.reduce_sum %774 {axis = 2 : i32} : (tensor<1x288x7x1xf32>) -> tensor<1x288x1x1xf32>
    %cst_271 = arith.constant dense<4.900000e+01> : tensor<1xf32>
    %cst_272 = arith.constant dense<0.0204081628> : tensor<1xf32>
    %776 = tosa.mul %cst_272, %775 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x1x1xf32>
    %cst_273 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %777 = tosa.transpose %776, %cst_273 : (tensor<1x288x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x288xf32>
    %cst_274 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %778 = tosa.transpose %arg155, %cst_274 : (tensor<72x288x1x1xf32>, tensor<4xi32>) -> tensor<72x1x1x288xf32>
    %779 = tosa.conv2d %777, %778, %arg156 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x288xf32>, tensor<72x1x1x288xf32>, tensor<72xf32>) -> tensor<1x1x1x72xf32>
    %cst_275 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %780 = tosa.transpose %779, %cst_275 : (tensor<1x1x1x72xf32>, tensor<4xi32>) -> tensor<1x72x1x1xf32>
    %cst_276 = arith.constant dense<0.000000e+00> : tensor<1x72x1x1xf32>
    %781 = tosa.maximum %780, %cst_276 : (tensor<1x72x1x1xf32>, tensor<1x72x1x1xf32>) -> tensor<1x72x1x1xf32>
    %cst_277 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %782 = tosa.transpose %781, %cst_277 : (tensor<1x72x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x72xf32>
    %cst_278 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %783 = tosa.transpose %arg157, %cst_278 : (tensor<288x72x1x1xf32>, tensor<4xi32>) -> tensor<288x1x1x72xf32>
    %784 = tosa.conv2d %782, %783, %arg158 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x72xf32>, tensor<288x1x1x72xf32>, tensor<288xf32>) -> tensor<1x1x1x288xf32>
    %cst_279 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %785 = tosa.transpose %784, %cst_279 : (tensor<1x1x1x288xf32>, tensor<4xi32>) -> tensor<1x288x1x1xf32>
    %cst_280 = arith.constant dense<3.000000e+00> : tensor<1x288x1x1xf32>
    %786 = tosa.add %785, %cst_280 : (tensor<1x288x1x1xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x1x1xf32>
    %787 = tosa.clamp %786 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x288x1x1xf32>) -> tensor<1x288x1x1xf32>
    %788 = tosa.clamp %787 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x288x1x1xf32>) -> tensor<1x288x1x1xf32>
    %cst_281 = arith.constant dense<6.000000e+00> : tensor<1x288x1x1xf32>
    %cst_282 = arith.constant dense<0.166666672> : tensor<1x288x1x1xf32>
    %789 = tosa.mul %788, %cst_282 {shift = 0 : i8} : (tensor<1x288x1x1xf32>, tensor<1x288x1x1xf32>) -> tensor<1x288x1x1xf32>
    %790 = tosa.mul %789, %773 {shift = 0 : i8} : (tensor<1x288x1x1xf32>, tensor<1x288x7x7xf32>) -> tensor<1x288x7x7xf32>
    %cst_283 = arith.constant dense<0.000000e+00> : tensor<96xf32>
    %cst_284 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %791 = tosa.transpose %790, %cst_284 : (tensor<1x288x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x288xf32>
    %cst_285 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %792 = tosa.transpose %arg159, %cst_285 : (tensor<96x288x1x1xf32>, tensor<4xi32>) -> tensor<96x1x1x288xf32>
    %793 = tosa.conv2d %791, %792, %cst_283 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x288xf32>, tensor<96x1x1x288xf32>, tensor<96xf32>) -> tensor<1x7x7x96xf32>
    %cst_286 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %794 = tosa.transpose %793, %cst_286 : (tensor<1x7x7x96xf32>, tensor<4xi32>) -> tensor<1x96x7x7xf32>
    %cst_287 = arith.constant dense<1.000000e-03> : tensor<96xf32>
    %795 = tosa.add %arg161, %cst_287 : (tensor<96xf32>, tensor<96xf32>) -> tensor<96xf32>
    %796 = math.sqrt %795 : tensor<96xf32>
    %797 = tosa.reciprocal %796 : (tensor<96xf32>) -> tensor<96xf32>
    %cst_288 = arith.constant dense<1.000000e+00> : tensor<96xf32>
    %798 = tosa.reshape %arg160 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %799 = tosa.reshape %arg160 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %800 = tosa.reshape %797 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %801 = tosa.reshape %797 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %802 = tosa.reshape %arg160 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %803 = tosa.sub %794, %802 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %804 = tosa.reshape %797 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %805 = tosa.mul %803, %804 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %806 = tosa.reshape %arg162 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %807 = tosa.reshape %arg162 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %808 = tosa.reshape %arg162 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %809 = tosa.mul %805, %808 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %810 = tosa.reshape %arg163 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %811 = tosa.reshape %arg163 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %812 = tosa.reshape %arg163 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %813 = tosa.add %809, %812 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %cst_289 = arith.constant dense<0.000000e+00> : tensor<576xf32>
    %cst_290 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %814 = tosa.transpose %813, %cst_290 : (tensor<1x96x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x96xf32>
    %cst_291 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %815 = tosa.transpose %arg164, %cst_291 : (tensor<576x96x1x1xf32>, tensor<4xi32>) -> tensor<576x1x1x96xf32>
    %816 = tosa.conv2d %814, %815, %cst_289 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x96xf32>, tensor<576x1x1x96xf32>, tensor<576xf32>) -> tensor<1x7x7x576xf32>
    %cst_292 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %817 = tosa.transpose %816, %cst_292 : (tensor<1x7x7x576xf32>, tensor<4xi32>) -> tensor<1x576x7x7xf32>
    %cst_293 = arith.constant dense<1.000000e-03> : tensor<576xf32>
    %818 = tosa.add %arg166, %cst_293 : (tensor<576xf32>, tensor<576xf32>) -> tensor<576xf32>
    %819 = math.sqrt %818 : tensor<576xf32>
    %820 = tosa.reciprocal %819 : (tensor<576xf32>) -> tensor<576xf32>
    %cst_294 = arith.constant dense<1.000000e+00> : tensor<576xf32>
    %821 = tosa.reshape %arg165 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %822 = tosa.reshape %arg165 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %823 = tosa.reshape %820 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %824 = tosa.reshape %820 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %825 = tosa.reshape %arg165 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %826 = tosa.sub %817, %825 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %827 = tosa.reshape %820 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %828 = tosa.mul %826, %827 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %829 = tosa.reshape %arg167 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %830 = tosa.reshape %arg167 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %831 = tosa.reshape %arg167 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %832 = tosa.mul %828, %831 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %833 = tosa.reshape %arg168 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %834 = tosa.reshape %arg168 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %835 = tosa.reshape %arg168 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %836 = tosa.add %832, %835 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %cst_295 = arith.constant dense<3.000000e+00> : tensor<1x576x7x7xf32>
    %837 = tosa.add %836, %cst_295 : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %838 = tosa.clamp %837 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %839 = tosa.clamp %838 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %840 = tosa.mul %836, %839 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_296 = arith.constant dense<6.000000e+00> : tensor<1x576x7x7xf32>
    %cst_297 = arith.constant dense<0.166666672> : tensor<1x576x7x7xf32>
    %841 = tosa.mul %840, %cst_297 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_298 = arith.constant dense<0.000000e+00> : tensor<576xf32>
    %cst_299 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %842 = tosa.transpose %841, %cst_299 : (tensor<1x576x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x576xf32>
    %cst_300 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %843 = tosa.transpose %arg169, %cst_300 : (tensor<576x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x576x1xf32>
    %844 = tosa.depthwise_conv2d %842, %843, %cst_298 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x7x7x576xf32>, tensor<5x5x576x1xf32>, tensor<576xf32>) -> tensor<1x7x7x576xf32>
    %cst_301 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %845 = tosa.transpose %844, %cst_301 : (tensor<1x7x7x576xf32>, tensor<4xi32>) -> tensor<1x576x7x7xf32>
    %cst_302 = arith.constant dense<1.000000e-03> : tensor<576xf32>
    %846 = tosa.add %arg171, %cst_302 : (tensor<576xf32>, tensor<576xf32>) -> tensor<576xf32>
    %847 = math.sqrt %846 : tensor<576xf32>
    %848 = tosa.reciprocal %847 : (tensor<576xf32>) -> tensor<576xf32>
    %cst_303 = arith.constant dense<1.000000e+00> : tensor<576xf32>
    %849 = tosa.reshape %arg170 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %850 = tosa.reshape %arg170 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %851 = tosa.reshape %848 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %852 = tosa.reshape %848 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %853 = tosa.reshape %arg170 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %854 = tosa.sub %845, %853 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %855 = tosa.reshape %848 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %856 = tosa.mul %854, %855 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %857 = tosa.reshape %arg172 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %858 = tosa.reshape %arg172 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %859 = tosa.reshape %arg172 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %860 = tosa.mul %856, %859 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %861 = tosa.reshape %arg173 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %862 = tosa.reshape %arg173 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %863 = tosa.reshape %arg173 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %864 = tosa.add %860, %863 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %cst_304 = arith.constant dense<3.000000e+00> : tensor<1x576x7x7xf32>
    %865 = tosa.add %864, %cst_304 : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %866 = tosa.clamp %865 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %867 = tosa.clamp %866 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %868 = tosa.mul %864, %867 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_305 = arith.constant dense<6.000000e+00> : tensor<1x576x7x7xf32>
    %cst_306 = arith.constant dense<0.166666672> : tensor<1x576x7x7xf32>
    %869 = tosa.mul %868, %cst_306 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %870 = tosa.reduce_sum %869 {axis = 3 : i32} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x1xf32>
    %871 = tosa.reduce_sum %870 {axis = 2 : i32} : (tensor<1x576x7x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_307 = arith.constant dense<4.900000e+01> : tensor<1xf32>
    %cst_308 = arith.constant dense<0.0204081628> : tensor<1xf32>
    %872 = tosa.mul %cst_308, %871 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_309 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %873 = tosa.transpose %872, %cst_309 : (tensor<1x576x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x576xf32>
    %cst_310 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %874 = tosa.transpose %arg174, %cst_310 : (tensor<144x576x1x1xf32>, tensor<4xi32>) -> tensor<144x1x1x576xf32>
    %875 = tosa.conv2d %873, %874, %arg175 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x576xf32>, tensor<144x1x1x576xf32>, tensor<144xf32>) -> tensor<1x1x1x144xf32>
    %cst_311 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %876 = tosa.transpose %875, %cst_311 : (tensor<1x1x1x144xf32>, tensor<4xi32>) -> tensor<1x144x1x1xf32>
    %cst_312 = arith.constant dense<0.000000e+00> : tensor<1x144x1x1xf32>
    %877 = tosa.maximum %876, %cst_312 : (tensor<1x144x1x1xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %cst_313 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %878 = tosa.transpose %877, %cst_313 : (tensor<1x144x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x144xf32>
    %cst_314 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %879 = tosa.transpose %arg176, %cst_314 : (tensor<576x144x1x1xf32>, tensor<4xi32>) -> tensor<576x1x1x144xf32>
    %880 = tosa.conv2d %878, %879, %arg177 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x144xf32>, tensor<576x1x1x144xf32>, tensor<576xf32>) -> tensor<1x1x1x576xf32>
    %cst_315 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %881 = tosa.transpose %880, %cst_315 : (tensor<1x1x1x576xf32>, tensor<4xi32>) -> tensor<1x576x1x1xf32>
    %cst_316 = arith.constant dense<3.000000e+00> : tensor<1x576x1x1xf32>
    %882 = tosa.add %881, %cst_316 : (tensor<1x576x1x1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %883 = tosa.clamp %882 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %884 = tosa.clamp %883 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_317 = arith.constant dense<6.000000e+00> : tensor<1x576x1x1xf32>
    %cst_318 = arith.constant dense<0.166666672> : tensor<1x576x1x1xf32>
    %885 = tosa.mul %884, %cst_318 {shift = 0 : i8} : (tensor<1x576x1x1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %886 = tosa.mul %885, %869 {shift = 0 : i8} : (tensor<1x576x1x1xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_319 = arith.constant dense<0.000000e+00> : tensor<96xf32>
    %cst_320 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %887 = tosa.transpose %886, %cst_320 : (tensor<1x576x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x576xf32>
    %cst_321 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %888 = tosa.transpose %arg178, %cst_321 : (tensor<96x576x1x1xf32>, tensor<4xi32>) -> tensor<96x1x1x576xf32>
    %889 = tosa.conv2d %887, %888, %cst_319 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x576xf32>, tensor<96x1x1x576xf32>, tensor<96xf32>) -> tensor<1x7x7x96xf32>
    %cst_322 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %890 = tosa.transpose %889, %cst_322 : (tensor<1x7x7x96xf32>, tensor<4xi32>) -> tensor<1x96x7x7xf32>
    %cst_323 = arith.constant dense<1.000000e-03> : tensor<96xf32>
    %891 = tosa.add %arg180, %cst_323 : (tensor<96xf32>, tensor<96xf32>) -> tensor<96xf32>
    %892 = math.sqrt %891 : tensor<96xf32>
    %893 = tosa.reciprocal %892 : (tensor<96xf32>) -> tensor<96xf32>
    %cst_324 = arith.constant dense<1.000000e+00> : tensor<96xf32>
    %894 = tosa.reshape %arg179 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %895 = tosa.reshape %arg179 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %896 = tosa.reshape %893 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %897 = tosa.reshape %893 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %898 = tosa.reshape %arg179 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %899 = tosa.sub %890, %898 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %900 = tosa.reshape %893 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %901 = tosa.mul %899, %900 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %902 = tosa.reshape %arg181 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %903 = tosa.reshape %arg181 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %904 = tosa.reshape %arg181 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %905 = tosa.mul %901, %904 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %906 = tosa.reshape %arg182 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %907 = tosa.reshape %arg182 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %908 = tosa.reshape %arg182 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %909 = tosa.add %905, %908 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %910 = tosa.add %909, %813 : (tensor<1x96x7x7xf32>, tensor<1x96x7x7xf32>) -> tensor<1x96x7x7xf32>
    %cst_325 = arith.constant dense<0.000000e+00> : tensor<576xf32>
    %cst_326 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %911 = tosa.transpose %910, %cst_326 : (tensor<1x96x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x96xf32>
    %cst_327 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %912 = tosa.transpose %arg183, %cst_327 : (tensor<576x96x1x1xf32>, tensor<4xi32>) -> tensor<576x1x1x96xf32>
    %913 = tosa.conv2d %911, %912, %cst_325 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x96xf32>, tensor<576x1x1x96xf32>, tensor<576xf32>) -> tensor<1x7x7x576xf32>
    %cst_328 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %914 = tosa.transpose %913, %cst_328 : (tensor<1x7x7x576xf32>, tensor<4xi32>) -> tensor<1x576x7x7xf32>
    %cst_329 = arith.constant dense<1.000000e-03> : tensor<576xf32>
    %915 = tosa.add %arg185, %cst_329 : (tensor<576xf32>, tensor<576xf32>) -> tensor<576xf32>
    %916 = math.sqrt %915 : tensor<576xf32>
    %917 = tosa.reciprocal %916 : (tensor<576xf32>) -> tensor<576xf32>
    %cst_330 = arith.constant dense<1.000000e+00> : tensor<576xf32>
    %918 = tosa.reshape %arg184 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %919 = tosa.reshape %arg184 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %920 = tosa.reshape %917 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %921 = tosa.reshape %917 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %922 = tosa.reshape %arg184 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %923 = tosa.sub %914, %922 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %924 = tosa.reshape %917 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %925 = tosa.mul %923, %924 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %926 = tosa.reshape %arg186 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %927 = tosa.reshape %arg186 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %928 = tosa.reshape %arg186 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %929 = tosa.mul %925, %928 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %930 = tosa.reshape %arg187 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %931 = tosa.reshape %arg187 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %932 = tosa.reshape %arg187 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %933 = tosa.add %929, %932 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %cst_331 = arith.constant dense<3.000000e+00> : tensor<1x576x7x7xf32>
    %934 = tosa.add %933, %cst_331 : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %935 = tosa.clamp %934 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %936 = tosa.clamp %935 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %937 = tosa.mul %933, %936 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_332 = arith.constant dense<6.000000e+00> : tensor<1x576x7x7xf32>
    %cst_333 = arith.constant dense<0.166666672> : tensor<1x576x7x7xf32>
    %938 = tosa.mul %937, %cst_333 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_334 = arith.constant dense<0.000000e+00> : tensor<576xf32>
    %cst_335 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %939 = tosa.transpose %938, %cst_335 : (tensor<1x576x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x576xf32>
    %cst_336 = arith.constant dense<[2, 3, 0, 1]> : tensor<4xi32>
    %940 = tosa.transpose %arg188, %cst_336 : (tensor<576x1x5x5xf32>, tensor<4xi32>) -> tensor<5x5x576x1xf32>
    %941 = tosa.depthwise_conv2d %939, %940, %cst_334 {dilation = array<i64: 1, 1>, pad = array<i64: 2, 2, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x7x7x576xf32>, tensor<5x5x576x1xf32>, tensor<576xf32>) -> tensor<1x7x7x576xf32>
    %cst_337 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %942 = tosa.transpose %941, %cst_337 : (tensor<1x7x7x576xf32>, tensor<4xi32>) -> tensor<1x576x7x7xf32>
    %cst_338 = arith.constant dense<1.000000e-03> : tensor<576xf32>
    %943 = tosa.add %arg190, %cst_338 : (tensor<576xf32>, tensor<576xf32>) -> tensor<576xf32>
    %944 = math.sqrt %943 : tensor<576xf32>
    %945 = tosa.reciprocal %944 : (tensor<576xf32>) -> tensor<576xf32>
    %cst_339 = arith.constant dense<1.000000e+00> : tensor<576xf32>
    %946 = tosa.reshape %arg189 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %947 = tosa.reshape %arg189 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %948 = tosa.reshape %945 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %949 = tosa.reshape %945 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %950 = tosa.reshape %arg189 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %951 = tosa.sub %942, %950 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %952 = tosa.reshape %945 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %953 = tosa.mul %951, %952 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %954 = tosa.reshape %arg191 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %955 = tosa.reshape %arg191 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %956 = tosa.reshape %arg191 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %957 = tosa.mul %953, %956 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %958 = tosa.reshape %arg192 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %959 = tosa.reshape %arg192 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %960 = tosa.reshape %arg192 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %961 = tosa.add %957, %960 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %cst_340 = arith.constant dense<3.000000e+00> : tensor<1x576x7x7xf32>
    %962 = tosa.add %961, %cst_340 : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %963 = tosa.clamp %962 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %964 = tosa.clamp %963 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %965 = tosa.mul %961, %964 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_341 = arith.constant dense<6.000000e+00> : tensor<1x576x7x7xf32>
    %cst_342 = arith.constant dense<0.166666672> : tensor<1x576x7x7xf32>
    %966 = tosa.mul %965, %cst_342 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %967 = tosa.reduce_sum %966 {axis = 3 : i32} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x1xf32>
    %968 = tosa.reduce_sum %967 {axis = 2 : i32} : (tensor<1x576x7x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_343 = arith.constant dense<4.900000e+01> : tensor<1xf32>
    %cst_344 = arith.constant dense<0.0204081628> : tensor<1xf32>
    %969 = tosa.mul %cst_344, %968 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_345 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %970 = tosa.transpose %969, %cst_345 : (tensor<1x576x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x576xf32>
    %cst_346 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %971 = tosa.transpose %arg193, %cst_346 : (tensor<144x576x1x1xf32>, tensor<4xi32>) -> tensor<144x1x1x576xf32>
    %972 = tosa.conv2d %970, %971, %arg194 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x576xf32>, tensor<144x1x1x576xf32>, tensor<144xf32>) -> tensor<1x1x1x144xf32>
    %cst_347 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %973 = tosa.transpose %972, %cst_347 : (tensor<1x1x1x144xf32>, tensor<4xi32>) -> tensor<1x144x1x1xf32>
    %cst_348 = arith.constant dense<0.000000e+00> : tensor<1x144x1x1xf32>
    %974 = tosa.maximum %973, %cst_348 : (tensor<1x144x1x1xf32>, tensor<1x144x1x1xf32>) -> tensor<1x144x1x1xf32>
    %cst_349 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %975 = tosa.transpose %974, %cst_349 : (tensor<1x144x1x1xf32>, tensor<4xi32>) -> tensor<1x1x1x144xf32>
    %cst_350 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %976 = tosa.transpose %arg195, %cst_350 : (tensor<576x144x1x1xf32>, tensor<4xi32>) -> tensor<576x1x1x144xf32>
    %977 = tosa.conv2d %975, %976, %arg196 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x1x1x144xf32>, tensor<576x1x1x144xf32>, tensor<576xf32>) -> tensor<1x1x1x576xf32>
    %cst_351 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %978 = tosa.transpose %977, %cst_351 : (tensor<1x1x1x576xf32>, tensor<4xi32>) -> tensor<1x576x1x1xf32>
    %cst_352 = arith.constant dense<3.000000e+00> : tensor<1x576x1x1xf32>
    %979 = tosa.add %978, %cst_352 : (tensor<1x576x1x1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %980 = tosa.clamp %979 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %981 = tosa.clamp %980 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_353 = arith.constant dense<6.000000e+00> : tensor<1x576x1x1xf32>
    %cst_354 = arith.constant dense<0.166666672> : tensor<1x576x1x1xf32>
    %982 = tosa.mul %981, %cst_354 {shift = 0 : i8} : (tensor<1x576x1x1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %983 = tosa.mul %982, %966 {shift = 0 : i8} : (tensor<1x576x1x1xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_355 = arith.constant dense<0.000000e+00> : tensor<96xf32>
    %cst_356 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %984 = tosa.transpose %983, %cst_356 : (tensor<1x576x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x576xf32>
    %cst_357 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %985 = tosa.transpose %arg197, %cst_357 : (tensor<96x576x1x1xf32>, tensor<4xi32>) -> tensor<96x1x1x576xf32>
    %986 = tosa.conv2d %984, %985, %cst_355 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x576xf32>, tensor<96x1x1x576xf32>, tensor<96xf32>) -> tensor<1x7x7x96xf32>
    %cst_358 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %987 = tosa.transpose %986, %cst_358 : (tensor<1x7x7x96xf32>, tensor<4xi32>) -> tensor<1x96x7x7xf32>
    %cst_359 = arith.constant dense<1.000000e-03> : tensor<96xf32>
    %988 = tosa.add %arg199, %cst_359 : (tensor<96xf32>, tensor<96xf32>) -> tensor<96xf32>
    %989 = math.sqrt %988 : tensor<96xf32>
    %990 = tosa.reciprocal %989 : (tensor<96xf32>) -> tensor<96xf32>
    %cst_360 = arith.constant dense<1.000000e+00> : tensor<96xf32>
    %991 = tosa.reshape %arg198 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %992 = tosa.reshape %arg198 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %993 = tosa.reshape %990 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %994 = tosa.reshape %990 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %995 = tosa.reshape %arg198 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %996 = tosa.sub %987, %995 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %997 = tosa.reshape %990 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %998 = tosa.mul %996, %997 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %999 = tosa.reshape %arg200 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %1000 = tosa.reshape %arg200 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %1001 = tosa.reshape %arg200 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %1002 = tosa.mul %998, %1001 {shift = 0 : i8} : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %1003 = tosa.reshape %arg201 {new_shape = array<i64: 96, 1>} : (tensor<96xf32>) -> tensor<96x1xf32>
    %1004 = tosa.reshape %arg201 {new_shape = array<i64: 96, 1, 1>} : (tensor<96xf32>) -> tensor<96x1x1xf32>
    %1005 = tosa.reshape %arg201 {new_shape = array<i64: 1, 96, 1, 1>} : (tensor<96xf32>) -> tensor<1x96x1x1xf32>
    %1006 = tosa.add %1002, %1005 : (tensor<1x96x7x7xf32>, tensor<1x96x1x1xf32>) -> tensor<1x96x7x7xf32>
    %1007 = tosa.add %1006, %910 : (tensor<1x96x7x7xf32>, tensor<1x96x7x7xf32>) -> tensor<1x96x7x7xf32>
    %cst_361 = arith.constant dense<0.000000e+00> : tensor<576xf32>
    %cst_362 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %1008 = tosa.transpose %1007, %cst_362 : (tensor<1x96x7x7xf32>, tensor<4xi32>) -> tensor<1x7x7x96xf32>
    %cst_363 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %1009 = tosa.transpose %arg202, %cst_363 : (tensor<576x96x1x1xf32>, tensor<4xi32>) -> tensor<576x1x1x96xf32>
    %1010 = tosa.conv2d %1008, %1009, %cst_361 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x7x96xf32>, tensor<576x1x1x96xf32>, tensor<576xf32>) -> tensor<1x7x7x576xf32>
    %cst_364 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %1011 = tosa.transpose %1010, %cst_364 : (tensor<1x7x7x576xf32>, tensor<4xi32>) -> tensor<1x576x7x7xf32>
    %cst_365 = arith.constant dense<1.000000e-03> : tensor<576xf32>
    %1012 = tosa.add %arg204, %cst_365 : (tensor<576xf32>, tensor<576xf32>) -> tensor<576xf32>
    %1013 = math.sqrt %1012 : tensor<576xf32>
    %1014 = tosa.reciprocal %1013 : (tensor<576xf32>) -> tensor<576xf32>
    %cst_366 = arith.constant dense<1.000000e+00> : tensor<576xf32>
    %1015 = tosa.reshape %arg203 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %1016 = tosa.reshape %arg203 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %1017 = tosa.reshape %1014 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %1018 = tosa.reshape %1014 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %1019 = tosa.reshape %arg203 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %1020 = tosa.sub %1011, %1019 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %1021 = tosa.reshape %1014 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %1022 = tosa.mul %1020, %1021 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %1023 = tosa.reshape %arg205 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %1024 = tosa.reshape %arg205 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %1025 = tosa.reshape %arg205 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %1026 = tosa.mul %1022, %1025 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %1027 = tosa.reshape %arg206 {new_shape = array<i64: 576, 1>} : (tensor<576xf32>) -> tensor<576x1xf32>
    %1028 = tosa.reshape %arg206 {new_shape = array<i64: 576, 1, 1>} : (tensor<576xf32>) -> tensor<576x1x1xf32>
    %1029 = tosa.reshape %arg206 {new_shape = array<i64: 1, 576, 1, 1>} : (tensor<576xf32>) -> tensor<1x576x1x1xf32>
    %1030 = tosa.add %1026, %1029 : (tensor<1x576x7x7xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x7x7xf32>
    %cst_367 = arith.constant dense<3.000000e+00> : tensor<1x576x7x7xf32>
    %1031 = tosa.add %1030, %cst_367 : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %1032 = tosa.clamp %1031 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %1033 = tosa.clamp %1032 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %1034 = tosa.mul %1030, %1033 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %cst_368 = arith.constant dense<6.000000e+00> : tensor<1x576x7x7xf32>
    %cst_369 = arith.constant dense<0.166666672> : tensor<1x576x7x7xf32>
    %1035 = tosa.mul %1034, %cst_369 {shift = 0 : i8} : (tensor<1x576x7x7xf32>, tensor<1x576x7x7xf32>) -> tensor<1x576x7x7xf32>
    %1036 = tosa.reduce_sum %1035 {axis = 3 : i32} : (tensor<1x576x7x7xf32>) -> tensor<1x576x7x1xf32>
    %1037 = tosa.reduce_sum %1036 {axis = 2 : i32} : (tensor<1x576x7x1xf32>) -> tensor<1x576x1x1xf32>
    %cst_370 = arith.constant dense<4.900000e+01> : tensor<1xf32>
    %cst_371 = arith.constant dense<0.0204081628> : tensor<1xf32>
    %1038 = tosa.mul %cst_371, %1037 {shift = 0 : i8} : (tensor<1xf32>, tensor<1x576x1x1xf32>) -> tensor<1x576x1x1xf32>
    %1039 = tosa.reshape %1038 {new_shape = array<i64: 1, 576>} : (tensor<1x576x1x1xf32>) -> tensor<1x576xf32>
    %cst_372 = arith.constant dense<[1, 0]> : tensor<2xi32>
    %1040 = tosa.transpose %arg207, %cst_372 : (tensor<1024x576xf32>, tensor<2xi32>) -> tensor<576x1024xf32>
    %1041 = tosa.reshape %1038 {new_shape = array<i64: 1, 1, 576>} : (tensor<1x576x1x1xf32>) -> tensor<1x1x576xf32>
    %1042 = tosa.reshape %1040 {new_shape = array<i64: 1, 576, 1024>} : (tensor<576x1024xf32>) -> tensor<1x576x1024xf32>
    %1043 = tosa.matmul %1041, %1042 : (tensor<1x1x576xf32>, tensor<1x576x1024xf32>) -> tensor<1x1x1024xf32>
    %1044 = tosa.reshape %1043 {new_shape = array<i64: 1, 1024>} : (tensor<1x1x1024xf32>) -> tensor<1x1024xf32>
    %1045 = tosa.reshape %arg208 {new_shape = array<i64: 1, 1024>} : (tensor<1024xf32>) -> tensor<1x1024xf32>
    %1046 = tosa.add %1045, %1044 : (tensor<1x1024xf32>, tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %cst_373 = arith.constant dense<3.000000e+00> : tensor<1x1024xf32>
    %1047 = tosa.add %1046, %cst_373 : (tensor<1x1024xf32>, tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %1048 = tosa.clamp %1047 {max_fp = 0x7F800000 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %1049 = tosa.clamp %1048 {max_fp = 6.000000e+00 : f32, max_int = 6 : i64, min_fp = 0xFF800000 : f32, min_int = -9223372036854775807 : i64} : (tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %1050 = tosa.mul %1046, %1049 {shift = 0 : i8} : (tensor<1x1024xf32>, tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %cst_374 = arith.constant dense<6.000000e+00> : tensor<1x1024xf32>
    %cst_375 = arith.constant dense<0.166666672> : tensor<1x1024xf32>
    %1051 = tosa.mul %1050, %cst_375 {shift = 0 : i8} : (tensor<1x1024xf32>, tensor<1x1024xf32>) -> tensor<1x1024xf32>
    %cst_376 = arith.constant dense<[1, 0]> : tensor<2xi32>
    %1052 = tosa.transpose %arg209, %cst_376 : (tensor<1000x1024xf32>, tensor<2xi32>) -> tensor<1024x1000xf32>
    %1053 = tosa.reshape %1051 {new_shape = array<i64: 1, 1, 1024>} : (tensor<1x1024xf32>) -> tensor<1x1x1024xf32>
    %1054 = tosa.reshape %1052 {new_shape = array<i64: 1, 1024, 1000>} : (tensor<1024x1000xf32>) -> tensor<1x1024x1000xf32>
    %1055 = tosa.matmul %1053, %1054 : (tensor<1x1x1024xf32>, tensor<1x1024x1000xf32>) -> tensor<1x1x1000xf32>
    %1056 = tosa.reshape %1055 {new_shape = array<i64: 1, 1000>} : (tensor<1x1x1000xf32>) -> tensor<1x1000xf32>
    %1057 = tosa.reshape %arg210 {new_shape = array<i64: 1, 1000>} : (tensor<1000xf32>) -> tensor<1x1000xf32>
    %1058 = tosa.add %1057, %1056 : (tensor<1x1000xf32>, tensor<1x1000xf32>) -> tensor<1x1000xf32>
    return %1058 : tensor<1x1000xf32>
  }
}

