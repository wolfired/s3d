package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixCopyFromMatrix(dst:S3DMatrix, src:S3DMatrix):S3DMatrix{
		return s3d_matrixCopyFromRawData(dst, src.raw_data);
	}
}