package s3d_make{
	import s3d_matrix.s3d_matrixCopyFromRawData;
	import s3d_matrix.s3d_matrixMultiplicationInRawData;
	
	import s3d_misc.S3DConst;
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Rotation(deg_x:Number, deg_y:Number, deg_z:Number):S3DMatrix{
		var result:S3DMatrix = S3DUtils.IdentityMatrix();
		
		if(deg_x > 0.0){
			var rad_x:Number = deg_x * S3DConst.DEG_2_RAD;
			var sx:Number = Math.sin(rad_x);
			var cx:Number = Math.cos(rad_x);
			var raw_x:Vector.<Number> = Vector.<Number>([
				1.0, 0.0, 0.0, 0.0,
				0.0, sx, -cx, 0.0,
				0.0, cx, sx, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), result.raw_data, raw_x));
		}
		if(deg_y > 0.0){
			var rad_y:Number = deg_y * S3DConst.DEG_2_RAD;
			var sy:Number = Math.sin(rad_y);
			var cy:Number = Math.cos(rad_y);
			var raw_y:Vector.<Number> = Vector.<Number>([
				sy, 0.0, cy, 0.0,
				0.0, 1.0, 0.0, 0.0,
				cy, 0.0, -sy, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), result.raw_data, raw_y));
		}
		if(deg_z > 0.0){
			var rad_z:Number = deg_z * S3DConst.DEG_2_RAD;
			var sz:Number = Math.sin(rad_z);
			var cz:Number = Math.cos(rad_z);
			var raw_z:Vector.<Number> = Vector.<Number>([
				cz, sz, 0.0, 0.0,
				-sz, cz, 0.0, 0.0,
				0.0, 0.0, 1.0, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), result.raw_data, raw_z));
		}
		
		return result;
	}
}