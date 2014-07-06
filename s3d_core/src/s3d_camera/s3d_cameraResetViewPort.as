package s3d_camera{
	import s3d_struct.S3DCamera;

	public function s3d_cameraResetViewPort(camera:S3DCamera, view_port_width:Number, view_port_height:Number):void{
		camera.view_port_width = view_port_width;
		camera.view_port_height = view_port_height;
		camera.aspectRatio = view_port_width / view_port_height;
		
		camera.projectionMatrixInvalid = camera.screenMatrixInvalid = true;
	}
}