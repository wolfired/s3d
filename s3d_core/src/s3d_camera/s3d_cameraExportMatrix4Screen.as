package s3d_camera{
	import s3d_make.s3d_makeMatrix4Screen;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

	public function s3d_cameraExportMatrix4Screen(camera:S3DCamera):S3DMatrix{
		if(camera.screenMatrixInvalid){
			camera.screenMatrix = s3d_makeMatrix4Screen(camera.view_port_width, camera.view_port_original_width, camera.view_port_height, camera.view_port_original_height, camera.aspectRatio);
			
			camera.screenMatrixInvalid = false;
		}
		return camera.screenMatrix;
	}
}