package s3d_make{
	import s3d_struct.S3DVector;

	public function s3d_makePoint(x:Number, y:Number, z:Number):S3DVector{
		var result:S3DVector = new S3DVector();
		result.raw_data[0] = x;
		result.raw_data[1] = y;
		result.raw_data[2] = z;
		result.raw_data[3] = 1;
		return result;
	}
}