package s3d_misc{
	public function s3d_batchMatrixMultiplication(dst_vertex_raw_data:Vector.<Number>, src_vertex_raw_data:Vector.<Number>, matrix_raw_data:Vector.<Number>, vertex_wide:uint):void{
		var vertex_raw_data_length:uint = src_vertex_raw_data.length;
		
		var step:uint = vertex_wide * 4;
		
		var row00:uint, row01:uint, row02:uint, row03:uint;
		var row10:uint, row11:uint, row12:uint, row13:uint;
		var row20:uint, row21:uint, row22:uint, row23:uint;
		var row30:uint, row31:uint, row32:uint, row33:uint;
		
		var dst:Vector.<Number> = S3DUtils.Vector4NumberX(16);
		var left_raw_data:Vector.<Number> = src_vertex_raw_data;
		var right_raw_data:Vector.<Number> = matrix_raw_data;
		for (var i:int = 0; i < vertex_raw_data_length; i += step) {
			row00 = i + 0 * vertex_wide + 0;
			row01 = i + 0 * vertex_wide + 1;
			row02 = i + 0 * vertex_wide + 2;
			row03 = i + 0 * vertex_wide + 3;
			
			row10 = i + 1 * vertex_wide + 0;
			row11 = i + 1 * vertex_wide + 1;
			row12 = i + 1 * vertex_wide + 2;
			row13 = i + 1 * vertex_wide + 3;
			
			row20 = i + 2 * vertex_wide + 0;
			row21 = i + 2 * vertex_wide + 1;
			row22 = i + 2 * vertex_wide + 2;
			row23 = i + 2 * vertex_wide + 3;
			
			row30 = i + 3 * vertex_wide + 0;
			row31 = i + 3 * vertex_wide + 1;
			row32 = i + 3 * vertex_wide + 2;
			row33 = i + 3 * vertex_wide + 3;
			
			
			dst[0] = left_raw_data[row00] * right_raw_data[0] + left_raw_data[row01] * right_raw_data[4] + left_raw_data[row02] * right_raw_data[8] + left_raw_data[row03] * right_raw_data[12];
			dst[1] = left_raw_data[row00] * right_raw_data[1] + left_raw_data[row01] * right_raw_data[5] + left_raw_data[row02] * right_raw_data[9] + left_raw_data[row03] * right_raw_data[13];
			dst[2] = left_raw_data[row00] * right_raw_data[2] + left_raw_data[row01] * right_raw_data[6] + left_raw_data[row02] * right_raw_data[10] + left_raw_data[row03] * right_raw_data[14];
			dst[3] = left_raw_data[row00] * right_raw_data[3] + left_raw_data[row01] * right_raw_data[7] + left_raw_data[row02] * right_raw_data[11] + left_raw_data[row03] * right_raw_data[15];
			
			dst[4] = left_raw_data[row10] * right_raw_data[0] + left_raw_data[row11] * right_raw_data[4] + left_raw_data[row12] * right_raw_data[8] + left_raw_data[row13] * right_raw_data[12];
			dst[5] = left_raw_data[row10] * right_raw_data[1] + left_raw_data[row11] * right_raw_data[5] + left_raw_data[row12] * right_raw_data[9] + left_raw_data[row13] * right_raw_data[13];
			dst[6] = left_raw_data[row10] * right_raw_data[2] + left_raw_data[row11] * right_raw_data[6] + left_raw_data[row12] * right_raw_data[10] + left_raw_data[row13] * right_raw_data[14];
			dst[7] = left_raw_data[row10] * right_raw_data[3] + left_raw_data[row11] * right_raw_data[7] + left_raw_data[row12] * right_raw_data[11] + left_raw_data[row13] * right_raw_data[15];
			
			dst[8] = left_raw_data[row20] * right_raw_data[0] + left_raw_data[row21] * right_raw_data[4] + left_raw_data[row22] * right_raw_data[8] + left_raw_data[row23] * right_raw_data[12];
			dst[9] = left_raw_data[row20] * right_raw_data[1] + left_raw_data[row21] * right_raw_data[5] + left_raw_data[row22] * right_raw_data[9] + left_raw_data[row23] * right_raw_data[13];
			dst[10] = left_raw_data[row20] * right_raw_data[2] + left_raw_data[row21] * right_raw_data[6] + left_raw_data[row22] * right_raw_data[10] + left_raw_data[row23] * right_raw_data[14];
			dst[11] = left_raw_data[row20] * right_raw_data[3] + left_raw_data[row21] * right_raw_data[7] + left_raw_data[row22] * right_raw_data[11] + left_raw_data[row23] * right_raw_data[15];
			
			dst[12] = left_raw_data[row30] * right_raw_data[0] + left_raw_data[row31] * right_raw_data[4] + left_raw_data[row32] * right_raw_data[8] + left_raw_data[row33] * right_raw_data[12];
			dst[13] = left_raw_data[row30] * right_raw_data[1] + left_raw_data[row31] * right_raw_data[5] + left_raw_data[row32] * right_raw_data[9] + left_raw_data[row33] * right_raw_data[13];
			dst[14] = left_raw_data[row30] * right_raw_data[2] + left_raw_data[row31] * right_raw_data[6] + left_raw_data[row32] * right_raw_data[10] + left_raw_data[row33] * right_raw_data[14];
			dst[15] = left_raw_data[row30] * right_raw_data[3] + left_raw_data[row31] * right_raw_data[7] + left_raw_data[row32] * right_raw_data[11] + left_raw_data[row33] * right_raw_data[15];
			
			dst_vertex_raw_data[row00] = dst[0];
			dst_vertex_raw_data[row01] = dst[1];
			dst_vertex_raw_data[row02] = dst[2];
			dst_vertex_raw_data[row03] = dst[3];
			
			dst_vertex_raw_data[row10] = dst[4];
			dst_vertex_raw_data[row11] = dst[5];
			dst_vertex_raw_data[row12] = dst[6];
			dst_vertex_raw_data[row13] = dst[7];
			
			dst_vertex_raw_data[row20] = dst[8];
			dst_vertex_raw_data[row21] = dst[9];
			dst_vertex_raw_data[row22] = dst[10];
			dst_vertex_raw_data[row23] = dst[11];
			
			dst_vertex_raw_data[row30] = dst[12];
			dst_vertex_raw_data[row31] = dst[13];
			dst_vertex_raw_data[row32] = dst[14];
			dst_vertex_raw_data[row33] = dst[15];
		}
	}
}