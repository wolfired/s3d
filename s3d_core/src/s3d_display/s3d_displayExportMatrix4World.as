package s3d_display{
	import s3d_make.s3d_makeMatrix4Translation;
	
	import s3d_matrix.s3d_matrixMultiplication;
	
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DDisplayObject;
	import s3d_struct.S3DMatrix;

		public function s3d_displayExportMatrix4World(object:S3DDisplayObject):S3DMatrix{
			if(object.worldMatrixInvalid){
				object.worldMatrix = S3DUtils.IdentityMatrix();
				s3d_matrixMultiplication(object.worldMatrix, s3d_makeMatrix4Translation(object.x, object.y, object.z));
			}
			
			return object.worldMatrix;
		}
}