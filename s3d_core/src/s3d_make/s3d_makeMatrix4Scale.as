package s3d_make{
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Scale(sx:Number, sy:Number, sz:Number):S3DMatrix{
		return s3d_makeMatrix(Vector.<Number>([
			sx, 0.0, 0.0, 0.0,
			0.0, sy, 0.0, 0.0,
			0.0, 0.0, sz, 0.0,
			0.0, 0.0, 0.0, 1.0
		]));
	}
}
