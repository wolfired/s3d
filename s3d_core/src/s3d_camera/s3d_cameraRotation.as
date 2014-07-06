package s3d_camera{
	import s3d_struct.S3DCamera;

	public function s3d_cameraRotation(camera:S3DCamera, rx_deg:Number, ry_deg:Number, rz_deg:Number):void{
		camera.rx_deg = -rx_deg;
		camera.ry_deg = -ry_deg;
		camera.rz_deg = -rz_deg;
		
		camera.cameraMatrixInvalid = true;
	}
}