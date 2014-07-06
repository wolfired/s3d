package s3d_camera{
	import s3d_make.s3d_makeMatrix4Projection;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

	public function s3d_cameraExportProjectionMatrix(camera:S3DCamera):S3DMatrix{
		if(camera.projectionMatrixInvalid){
			camera.projectionMatrix = s3d_makeMatrix4Projection(camera.fovx_deg, camera.aspectRatio, camera.near, camera.far)
			
			camera.projectionMatrixInvalid = false;
		}
		return camera.projectionMatrix;
	}
}