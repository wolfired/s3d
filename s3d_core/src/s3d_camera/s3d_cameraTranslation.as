package s3d_camera{
	import s3d_struct.S3DCamera;

	public function s3d_cameraTranslation(camera:S3DCamera, tx:Number, ty:Number, tz:Number):void{
		camera.tx = -tx;
		camera.ty = -ty;
		camera.tz = -tz;
		
		camera.cameraMatrixInvalid = true;
	}
}