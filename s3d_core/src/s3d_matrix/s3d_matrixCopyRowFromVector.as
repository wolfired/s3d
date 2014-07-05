package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;

	public function s3d_matrixCopyRowFromVector(dst:S3DMatrix, row:uint, src:S3DVector):S3DMatrix{
		return s3d_matrixCopyRowFromRawData(dst, row, src.raw_data);
	}
}