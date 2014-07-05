package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_misc.S3DConst;

	public function s3d_matrixIdentity(target:S3DMatrix):S3DMatrix{
		s3d_matrixCopyFromRawData(target, S3DConst.IDENTITY_MATRIX_RAW_DATA);
		return target;
	}
}