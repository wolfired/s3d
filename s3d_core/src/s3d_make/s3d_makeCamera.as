package s3d_make{
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DVector;
	
	import s3d_vector.s3d_vectorCopyFromVector;

	public function s3d_makeCamera(point_at:S3DVector, point_to:S3DVector, up_vector:S3DVector, fovx:Number, near:Number, far:Number, view_port_width:Number, view_port_height:Number):S3DCamera{
		var result:S3DCamera = new S3DCamera();
		result.point_at = s3d_vectorCopyFromVector(S3DUtils.ZeroVector(), point_at);
		result.point_to = s3d_vectorCopyFromVector(S3DUtils.ZeroVector(), point_to);
		result.up_vector = s3d_vectorCopyFromVector(S3DUtils.ZeroVector(), up_vector);
		result.fovx_deg = fovx;
		result.near = near;
		result.far = far;
		result.view_port_width = view_port_width;
		result.view_port_height = view_port_height;
		result.aspectRatio = view_port_width / view_port_height;
		result.cameraMatrixInvalid = result.projectionMatrixInvalid = result.screenMatrixInvalid = true;
		return result;
	}
}