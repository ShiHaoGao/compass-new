module {
  func.func @transfer_read_write_index_1d(%arg0: memref<?xindex>, %arg1: index) -> vector<17xindex> {
    %c7 = arith.constant 7 : index
    %0 = vector.transfer_read %arg0[%arg1], %c7 : memref<?xindex>, vector<17xindex>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xindex>, memref<?xindex>
    return %0 : vector<17xindex>
  }
  func.func @transfer_read_write_index_1d_scalable(%arg0: memref<?xindex>, %arg1: index) -> vector<[17]xindex> {
    %c7 = arith.constant 7 : index
    %0 = vector.transfer_read %arg0[%arg1], %c7 : memref<?xindex>, vector<[17]xindex>
    vector.transfer_write %0, %arg0[%arg1] : vector<[17]xindex>, memref<?xindex>
    return %0 : vector<[17]xindex>
  }
}