package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixCopyRowToRawData(raw_data:Vector.<Number>, row:uint, src:S3DMatrix):Vector.<Number>{
		var idx:uint = row * 4;
		raw_data[0] = src.raw_data[idx + 0];
		raw_data[1] = src.raw_data[idx + 1];
		raw_data[2] = src.raw_data[idx + 2];
		raw_data[3] = src.raw_data[idx + 3];
		return raw_data;
	}
}