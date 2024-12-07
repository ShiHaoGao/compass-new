module {
  func.func @insert_strided_index_slice_index_2d_into_3d(%arg0: vector<4x4xindex>, %arg1: vector<4x4x4xindex>) -> vector<4x4x4xindex> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x4xindex> into vector<4x4x4xindex>
    return %0 : vector<4x4x4xindex>
  }
  func.func @insert_strided_index_slice_index_2d_into_3d_scalable(%arg0: vector<4x[4]xindex>, %arg1: vector<4x4x[4]xindex>) -> vector<4x4x[4]xindex> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x[4]xindex> into vector<4x4x[4]xindex>
    return %0 : vector<4x4x[4]xindex>
  }
}