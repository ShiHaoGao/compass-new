module {
  func.func @extract_strided_slice_f32_2d_from_2d(%arg0: vector<4x8xf32>) -> vector<2x2xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 2], sizes = [2, 2], strides = [1, 1]} : vector<4x8xf32> to vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @extract_strided_slice_f32_2d_from_2d_scalable(%arg0: vector<4x[8]xf32>) -> vector<2x[8]xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 0], sizes = [2, 8], strides = [1, 1]} : vector<4x[8]xf32> to vector<2x[8]xf32>
    return %0 : vector<2x[8]xf32>
  }
}