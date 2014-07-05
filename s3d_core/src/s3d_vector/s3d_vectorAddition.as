package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorAddition(left:S3DVector, right:S3DVector):S3DVector{
		left.raw_data[0] += right.raw_data[0];
		left.raw_data[1] += right.raw_data[1];
		left.raw_data[2] += right.raw_data[2];
		return left;
	}
}