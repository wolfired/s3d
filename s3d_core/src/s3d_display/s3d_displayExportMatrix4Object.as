package s3d_display{
	import s3d_make.s3d_makeMatrix4Rotation;
	import s3d_make.s3d_makeMatrix4Scale;
	
	import s3d_matrix.s3d_matrixMultiplication;
	
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DDisplayObject;
	import s3d_struct.S3DMatrix;

		public function s3d_displayExportMatrix4Object(object:S3DDisplayObject):S3DMatrix{
			if(object.objectMatrixInvalid){
				object.objectMatrix = S3DUtils.IdentityMatrix();
				s3d_matrixMultiplication(object.objectMatrix, s3d_makeMatrix4Rotation(object.rx_deg, object.ry_deg, object.rz_deg));
				s3d_matrixMultiplication(object.objectMatrix, s3d_makeMatrix4Scale(object.sx, object.sy, object.sz));
			}
			
			return object.objectMatrix;
		}
}