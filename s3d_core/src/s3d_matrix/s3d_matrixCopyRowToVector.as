package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;

	public function s3d_matrixCopyRowToVector(dst:S3DVector, row:uint, src:S3DMatrix):S3DVector{
		s3d_matrixCopyRowToRawData(dst.raw_data, row, src);
		return dst;
	}
}