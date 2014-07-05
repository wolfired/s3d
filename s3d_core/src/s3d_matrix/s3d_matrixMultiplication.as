package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_misc.S3DUtils;

	public function s3d_matrixMultiplication(left:S3DMatrix, right:S3DMatrix):S3DMatrix{
		return s3d_matrixCopyFromRawData(left, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), left.raw_data, right.raw_data));
	}
}