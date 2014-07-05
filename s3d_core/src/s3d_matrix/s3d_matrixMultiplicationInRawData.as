package s3d_matrix{
	public function s3d_matrixMultiplicationInRawData(dst:Vector.<Number>, left_raw_data:Vector.<Number>, right_raw_data:Vector.<Number>):Vector.<Number>{
		dst[0] = left_raw_data[0] * right_raw_data[0] + left_raw_data[1] * right_raw_data[4] + left_raw_data[2] * right_raw_data[8] + left_raw_data[3] * right_raw_data[12];
		dst[1] = left_raw_data[0] * right_raw_data[1] + left_raw_data[1] * right_raw_data[5] + left_raw_data[2] * right_raw_data[9] + left_raw_data[3] * right_raw_data[13];
		dst[2] = left_raw_data[0] * right_raw_data[2] + left_raw_data[1] * right_raw_data[6] + left_raw_data[2] * right_raw_data[10] + left_raw_data[3] * right_raw_data[14];
		dst[3] = left_raw_data[0] * right_raw_data[3] + left_raw_data[1] * right_raw_data[7] + left_raw_data[2] * right_raw_data[11] + left_raw_data[3] * right_raw_data[15];
		
		dst[4] = left_raw_data[4] * right_raw_data[0] + left_raw_data[5] * right_raw_data[4] + left_raw_data[6] * right_raw_data[8] + left_raw_data[7] * right_raw_data[12];
		dst[5] = left_raw_data[4] * right_raw_data[1] + left_raw_data[5] * right_raw_data[5] + left_raw_data[6] * right_raw_data[9] + left_raw_data[7] * right_raw_data[13];
		dst[6] = left_raw_data[4] * right_raw_data[2] + left_raw_data[5] * right_raw_data[6] + left_raw_data[6] * right_raw_data[10] + left_raw_data[7] * right_raw_data[14];
		dst[7] = left_raw_data[4] * right_raw_data[3] + left_raw_data[5] * right_raw_data[7] + left_raw_data[6] * right_raw_data[11] + left_raw_data[7] * right_raw_data[15];
		
		dst[8] = left_raw_data[8] * right_raw_data[0] + left_raw_data[9] * right_raw_data[4] + left_raw_data[10] * right_raw_data[8] + left_raw_data[11] * right_raw_data[12];
		dst[9] = left_raw_data[8] * right_raw_data[1] + left_raw_data[9] * right_raw_data[5] + left_raw_data[10] * right_raw_data[9] + left_raw_data[11] * right_raw_data[13];
		dst[10] = left_raw_data[8] * right_raw_data[2] + left_raw_data[9] * right_raw_data[6] + left_raw_data[10] * right_raw_data[10] + left_raw_data[11] * right_raw_data[14];
		dst[11] = left_raw_data[8] * right_raw_data[3] + left_raw_data[9] * right_raw_data[7] + left_raw_data[10] * right_raw_data[11] + left_raw_data[11] * right_raw_data[15];
		
		dst[12] = left_raw_data[12] * right_raw_data[0] + left_raw_data[13] * right_raw_data[4] + left_raw_data[14] * right_raw_data[8] + left_raw_data[15] * right_raw_data[12];
		dst[13] = left_raw_data[12] * right_raw_data[1] + left_raw_data[13] * right_raw_data[5] + left_raw_data[14] * right_raw_data[9] + left_raw_data[15] * right_raw_data[13];
		dst[14] = left_raw_data[12] * right_raw_data[2] + left_raw_data[13] * right_raw_data[6] + left_raw_data[14] * right_raw_data[10] + left_raw_data[15] * right_raw_data[14];
		dst[15] = left_raw_data[12] * right_raw_data[3] + left_raw_data[13] * right_raw_data[7] + left_raw_data[14] * right_raw_data[11] + left_raw_data[15] * right_raw_data[15];
		
		return dst;
	}
}