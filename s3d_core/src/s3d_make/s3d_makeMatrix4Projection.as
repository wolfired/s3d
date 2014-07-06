package s3d_make{
	import s3d_misc.S3DConst;
	
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Projection(fovx_deg:Number, aspectRatio:Number, near:Number, far:Number):S3DMatrix{
		var zoom_x:Number = 1 / Math.tan(fovx_deg * S3DConst.DEG_2_RAD / 2);
		var zoom_y:Number = aspectRatio * zoom_x;
		return s3d_makeMatrix(Vector.<Number>([
			zoom_x, 0.0, 0.0, 0.0,
			0.0, zoom_y, 0.0, 0.0,
			0.0, 0.0, (far + near)/(far - near), 1.0,
			0.0, 0.0, (-2 * far * near)/(far - near), 0.0
		]));
	}
}