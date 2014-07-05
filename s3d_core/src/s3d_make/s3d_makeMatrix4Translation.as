package s3d_make{
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Translation(tx:Number, ty:Number, tz:Number):S3DMatrix{
		return s3d_makeMatrix(Vector.<Number>([
			1.0, 0.0, 0.0, 0.0,
			0.0, 1.0, 0.0, 0.0,
			0.0, 0.0, 1.0, 0.0,
			tx, ty, tz, 1.0
		]));
	}
}