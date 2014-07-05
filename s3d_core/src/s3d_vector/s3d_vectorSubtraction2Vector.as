package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorSubtraction2Vector(dst:S3DVector, left:S3DVector, right:S3DVector):S3DVector{
		dst.raw_data[0] = left.raw_data[0] - right.raw_data[0];
		dst.raw_data[1] = left.raw_data[1] - right.raw_data[1];
		dst.raw_data[2] = left.raw_data[2] - right.raw_data[2];
		return dst;
	}
}