package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;

	public function s3d_matrixCopyColumnFromVector(dst:S3DMatrix, column:uint, src:S3DVector):S3DMatrix{
		return s3d_matrixCopyColumnFromRawData(dst, column, src.raw_data);
	}
}