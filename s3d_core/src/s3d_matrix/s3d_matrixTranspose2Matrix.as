package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixTranspose2Matrix(dst:S3DMatrix, src:S3DMatrix):S3DMatrix{
		s3d_matrixTransposeInRawData(dst.raw_data, src.raw_data);		
		return dst;
	}
}