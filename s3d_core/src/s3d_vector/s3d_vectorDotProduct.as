package s3d_vector{
	import s3d_struct.S3DVector;

	public function s3d_vectorDotProduct(left:S3DVector, right:S3DVector):Number{
		return left.raw_data[0] * right.raw_data[0] + left.raw_data[1] * right.raw_data[1] + left.raw_data[2] * right.raw_data[2];
	}
}