package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorNormalize(target:S3DVector):S3DVector{
		var len:Number = s3d_vectorLength(target);
		target.raw_data[0] /= len;
		target.raw_data[1] /= len;
		target.raw_data[2] /= len;
		return target;
	}
}