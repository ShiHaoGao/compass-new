#map = affine_map<(d0, d1, d2, d3, d4) -> (0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @torch.aten.convolution$nobias(%arg0: tensor<1x24x16x128x128xf16>, %arg1: tensor<54x24x1x1x1xf16>) -> tensor<1x54x16x128x128xf16> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<1x54x16x128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x54x16x128x128xf32>) -> tensor<1x54x16x128x128xf32>
    %2 = linalg.conv_3d_ncdhw_fcdhw {dilations = dense<1> : vector<3xi64>, strides = dense<1> : vector<3xi64>} ins(%arg0, %arg1 : tensor<1x24x16x128x128xf16>, tensor<54x24x1x1x1xf16>) outs(%1 : tensor<1x54x16x128x128xf32>) -> tensor<1x54x16x128x128xf32>
    %3 = tensor.empty() : tensor<1x54x16x128x128xf16>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%2 : tensor<1x54x16x128x128xf32>) outs(%3 : tensor<1x54x16x128x128xf16>) {
    ^bb0(%in: f32, %out: f16):
      %5 = arith.truncf %in : f32 to f16
      linalg.yield %5 : f16
    } -> tensor<1x54x16x128x128xf16>
    return %4 : tensor<1x54x16x128x128xf16>
  }
  func.func @q_conv_test(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?xf32>) -> tensor<?x?x?x?xf32> {
    %c1_i64 = arith.constant 1 : i64
    %c0 = arith.constant 0 : index
    %cst = arith.constant -2.14748365E+9 : f32
    %cst_0 = arith.constant 2.14748365E+9 : f32
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst_1 = arith.constant 0.000000e+00 : f32
    %cst_2 = arith.constant 1.000000e-04 : f64
    %c7_i32 = arith.constant 7 : i32
    %c3_i32 = arith.constant 3 : i32
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim) : tensor<?xi32>
    %1 = linalg.generic {indexing_maps = [#map2, #map2], iterator_types = ["parallel"]} ins(%arg2 : tensor<?xf32>) outs(%0 : tensor<?xi32>) {
    ^bb0(%in: f32, %out: i32):
      %19 = arith.truncf %cst_2 : f64 to f32
      %20 = arith.divf %in, %19 : f32
      %21 = math.roundeven %20 : f32
      %22 = arith.addf %21, %cst_1 : f32
      %23 = arith.maximumf %22, %cst : f32
      %24 = arith.minimumf %23, %cst_0 : f32
      %25 = arith.fptosi %24 : f32 to i32
      linalg.yield %25 : i32
    } -> tensor<?xi32>
    %2 = tensor.empty(%dim) : tensor<?xf32>
    %3 = linalg.generic {indexing_maps = [#map2, #map2], iterator_types = ["parallel"]} ins(%1 : tensor<?xi32>) outs(%2 : tensor<?xf32>) {
    ^bb0(%in: i32, %out: f32):
      %19 = arith.sitofp %in : i32 to f32
      %20 = arith.truncf %cst_2 : f64 to f32
      %21 = arith.mulf %19, %20 : f32
      linalg.yield %21 : f32
    } -> tensor<?xf32>
    %4 = linalg.generic {indexing_maps = [#map2, #map2], iterator_types = ["parallel"]} ins(%3 : tensor<?xf32>) outs(%0 : tensor<?xi32>) {
    ^bb0(%in: f32, %out: i32):
      %19 = arith.truncf %cst_2 : f64 to f32
      %20 = arith.divf %in, %19 : f32
      %21 = math.roundeven %20 : f32
      %22 = arith.addf %21, %cst_1 : f32
      %23 = arith.maximumf %22, %cst : f32
      %24 = arith.minimumf %23, %cst_0 : f32
      %25 = arith.fptosi %24 : f32 to i32
      linalg.yield %25 : i32
    } -> tensor<?xi32>
    %dim_3 = tensor.dim %arg0, %c0 : tensor<?x?x?x?xi8>
    %dim_4 = tensor.dim %arg0, %c2 : tensor<?x?x?x?xi8>
    %dim_5 = tensor.dim %arg0, %c3 : tensor<?x?x?x?xi8>
    %dim_6 = tensor.dim %arg1, %c0 : tensor<?x?x?x?xi8>
    %dim_7 = tensor.dim %arg1, %c2 : tensor<?x?x?x?xi8>
    %dim_8 = tensor.dim %arg1, %c3 : tensor<?x?x?x?xi8>
    %5 = arith.index_cast %dim_7 : index to i64
    %6 = arith.index_cast %dim_4 : index to i64
    %7 = arith.subi %5, %c1_i64 : i64
    %8 = arith.subi %6, %7 : i64
    %9 = arith.index_cast %8 : i64 to index
    %10 = arith.index_cast %dim_8 : index to i64
    %11 = arith.index_cast %dim_5 : index to i64
    %12 = arith.subi %10, %c1_i64 : i64
    %13 = arith.subi %11, %12 : i64
    %14 = arith.index_cast %13 : i64 to index
    %15 = tensor.empty(%dim_3, %dim_6, %9, %14) : tensor<?x?x?x?xi32>
    %broadcasted = linalg.broadcast ins(%4 : tensor<?xi32>) outs(%15 : tensor<?x?x?x?xi32>) dimensions = [0, 2, 3] 
    %16 = linalg.conv_2d_nchw_fchw_q {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%arg0, %arg1, %c7_i32, %c3_i32 : tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32) outs(%broadcasted : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    %17 = tensor.empty(%dim_3, %dim_6, %9, %14) : tensor<?x?x?x?xf32>
    %18 = linalg.generic {indexing_maps = [#map3, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%16 : tensor<?x?x?x?xi32>) outs(%17 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: i32, %out: f32):
      %19 = arith.sitofp %in : i32 to f32
      %20 = arith.truncf %cst_2 : f64 to f32
      %21 = arith.mulf %19, %20 : f32
      linalg.yield %21 : f32
    } -> tensor<?x?x?x?xf32>
    return %18 : tensor<?x?x?x?xf32>
  }
  func.func @conv_broadcast(%arg0: tensor<1x80x3000xf32>, %arg1: tensor<1024x80x3xf32>, %arg2: tensor<1024xf32>) -> tensor<1x1024x3000xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0, 1] high[0, 0, 1] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      tensor.yield %cst : f32
    } : tensor<1x80x3000xf32> to tensor<1x80x3002xf32>
    %0 = tensor.empty() : tensor<1x1024x3000xf32>
    %broadcasted = linalg.broadcast ins(%arg2 : tensor<1024xf32>) outs(%0 : tensor<1x1024x3000xf32>) dimensions = [0, 2] 
    %1 = linalg.conv_1d_ncw_fcw {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%padded, %arg1 : tensor<1x80x3002xf32>, tensor<1024x80x3xf32>) outs(%broadcasted : tensor<1x1024x3000xf32>) -> tensor<1x1024x3000xf32>
    return %1 : tensor<1x1024x3000xf32>
  }
}

