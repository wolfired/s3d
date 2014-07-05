package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixCopyColumnFromRawData(dst:S3DMatrix, column:uint, raw_data:Vector.<Number>):S3DMatrix{
		dst.raw_data[column + 0] = raw_data[0];
		dst.raw_data[column + 4] = raw_data[1];
		dst.raw_data[column + 8] = raw_data[2];
		dst.raw_data[column + 12] = raw_data[3];
		return dst;
	}
}