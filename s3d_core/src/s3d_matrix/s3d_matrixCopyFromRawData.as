package s3d_matrix{
	import s3d_struct.S3DMatrix;
	import s3d_misc.s3d_raw2raw16;

	public function s3d_matrixCopyFromRawData(dst:S3DMatrix, raw_data:Vector.<Number>):S3DMatrix{
		s3d_raw2raw16(dst.raw_data, raw_data);
		return dst;
	}
}