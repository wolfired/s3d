package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixMultiplication2Matrix(dst:S3DMatrix, left:S3DMatrix, right:S3DMatrix):S3DMatrix{
		s3d_matrixMultiplicationInRawData(dst.raw_data, left.raw_data, right.raw_data);
		return dst;
	}
}