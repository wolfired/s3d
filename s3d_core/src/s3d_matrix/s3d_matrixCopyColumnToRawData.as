package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixCopyColumnToRawData(raw_data:Vector.<Number>, column:uint, src:S3DMatrix):Vector.<Number>{
		raw_data[0] = src.raw_data[column + 0];
		raw_data[1] = src.raw_data[column + 4];
		raw_data[2] = src.raw_data[column + 8];
		raw_data[3] = src.raw_data[column + 12];
		return raw_data;
	}
}