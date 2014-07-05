package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorNormalize2Vector(dst:S3DVector, target:S3DVector):S3DVector{
		var len:Number = s3d_vectorLength(target);
		dst.raw_data[0] = target.raw_data[0] / len;
		dst.raw_data[1] = target.raw_data[1] / len;
		dst.raw_data[2] = target.raw_data[2] / len;
		return dst;
	}
}