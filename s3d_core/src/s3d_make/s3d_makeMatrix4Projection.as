package s3d_make{
	import s3d_misc.S3DConst;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Projection(camera:S3DCamera):S3DMatrix{
		var zoom_x:Number = 1 / Math.tan(camera.fovx * S3DConst.DEG_2_RAD / 2);
		var zoom_y:Number = camera.aspectRatio * zoom_x;
		var near:Number = camera.near;
		var far:Number = camera.far;
		return s3d_makeMatrix(Vector.<Number>([
			zoom_x, 0.0, 0.0, 0.0,
			0.0, zoom_y, 0.0, 0.0,
			0.0, 0.0, (far + near)/(far - near), 1.0,
			0.0, 0.0, (-2 * far * near)/(far - near), 0.0
		]));
	}
}