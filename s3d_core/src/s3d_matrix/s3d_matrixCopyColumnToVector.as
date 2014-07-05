package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;

	public function s3d_matrixCopyColumnToVector(dst:S3DVector, column:uint, src:S3DMatrix):S3DVector{
		s3d_matrixCopyColumnToRawData(dst.raw_data, column, src);
		return dst;
	}
}