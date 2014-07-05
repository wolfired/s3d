package s3d_make{
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

		public function s3d_makeMatrix4Screen(cam:S3DCamera):S3DMatrix{
			var width:Number = (cam.view_port_width - 1) / 2;
			var height:Number = (cam.view_port_height - 1) / 2;
			return s3d_makeMatrix(Vector.<Number>([
				width, 0.0, 0.0, 0.0,
				0.0, -height, 0.0, 0.0,
				0.0, 0.0, 1, 0.0,
				width, height, 0.0, 1.0
			]));
		}
}