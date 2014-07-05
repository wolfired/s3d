package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorLength(target:S3DVector):Number{
		return Math.sqrt(target.raw_data[0] * target.raw_data[0] + target.raw_data[1] * target.raw_data[1] + target.raw_data[2] * target.raw_data[2]);
	}
}