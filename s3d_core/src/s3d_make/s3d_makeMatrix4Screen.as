package s3d_make{
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Screen(camera:S3DCamera):S3DMatrix{
		var half_width:Number = (camera.view_port_width - 1) / 2;
		var half_height:Number = (camera.view_port_height - 1) / 2;
		return s3d_makeMatrix(Vector.<Number>([
			half_width, 0.0, 0.0, 0.0,
			0.0, -half_height, 0.0, 0.0,
			0.0, 0.0, 1.0, 0.0,
			half_width, half_height, 0.0, 1.0
		]));
	}
}