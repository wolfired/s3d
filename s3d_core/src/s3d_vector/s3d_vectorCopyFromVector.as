package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorCopyFromVector(dst:S3DVector, src:S3DVector):S3DVector{
		return s3d_vectorCopyFromRawData(dst, src.raw_data);
	}
}