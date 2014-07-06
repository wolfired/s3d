package s3d_camera{
	import s3d_make.s3d_makeMatrix4Rotation;
	import s3d_make.s3d_makeMatrix4Translation;
	import s3d_make.s3d_makeMatrix4UVN;
	
	import s3d_matrix.s3d_matrixMultiplication;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;

	public function s3d_cameraExportCameraMatrix(camera:S3DCamera):S3DMatrix{
		if(camera.cameraMatrixInvalid){
			camera.cameraMatrix = s3d_makeMatrix4UVN(camera.point_at, camera.point_to, camera.up_vector);
			
			s3d_matrixMultiplication(camera.cameraMatrix, s3d_makeMatrix4Translation(camera.tx, camera.ty, camera.tz));
			s3d_matrixMultiplication(camera.cameraMatrix, s3d_makeMatrix4Rotation(camera.rx_deg, camera.ry_deg, camera.rz_deg));
			
			camera.cameraMatrixInvalid = false;
		}
		return camera.cameraMatrix;
	}
}