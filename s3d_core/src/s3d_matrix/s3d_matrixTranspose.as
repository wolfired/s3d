package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_misc.S3DUtils;

	public function s3d_matrixTranspose(target:S3DMatrix):S3DMatrix{
		return s3d_matrixCopyFromRawData(target, s3d_matrixTransposeInRawData(S3DUtils.Vector4NumberX(16), target.raw_data);
	}
}