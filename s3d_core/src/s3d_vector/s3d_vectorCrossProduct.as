package s3d_vector{
	import s3d_struct.S3DVector;
	import s3d_misc.S3DUtils;

	public function s3d_vectorCrossProduct(left:S3DVector, right:S3DVector):S3DVector{
		var temp:Vector.<Number> = S3DUtils.Vector4Number4();
		temp[0] = left.raw_data[1] * right.raw_data[2] - left.raw_data[2] * right.raw_data[1];
		temp[1] = left.raw_data[2] * right.raw_data[0] - left.raw_data[0] * right.raw_data[2];
		temp[2] = left.raw_data[0] * right.raw_data[1] - left.raw_data[1] * right.raw_data[0];
		return s3d_vectorCopyFromRawData(left, temp);
	}
}