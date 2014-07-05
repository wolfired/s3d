package s3d_vector{
	import s3d_struct.S3DVector;
	import s3d_misc.s3d_raw2raw4;

	public function s3d_vectorCopyFromRawData(dst:S3DVector, raw_data:Vector.<Number>):S3DVector{
		s3d_raw2raw4(dst.raw_data, raw_data);
		return dst;
	}
}