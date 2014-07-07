package s3d_make{
	import s3d_matrix.s3d_matrixCopyFromRawData;
	import s3d_matrix.s3d_matrixMultiplicationInRawData;
	
	import s3d_misc.S3DConst;
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix4Rotation(rx_deg:Number, ry_deg:Number, rz_deg:Number):S3DMatrix{
		var result:S3DMatrix = S3DUtils.IdentityMatrix();
		
		if(rx_deg != 0.0){
			var rx_rad:Number = rx_deg * S3DConst.DEG_2_RAD;
			var sx:Number = Math.sin(rx_rad);
			var cx:Number = Math.cos(rx_rad);
			var raw_x:Vector.<Number> = Vector.<Number>([
				1.0, 0.0, 0.0, 0.0,
				0.0, sx, -cx, 0.0,
				0.0, cx, sx, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4NumberX(16), result.raw_data, raw_x));
		}
		if(ry_deg != 0.0){
			var ry_rad:Number = ry_deg * S3DConst.DEG_2_RAD;
			var sy:Number = Math.sin(ry_rad);
			var cy:Number = Math.cos(ry_rad);
			var raw_y:Vector.<Number> = Vector.<Number>([
				sy, 0.0, cy, 0.0,
				0.0, 1.0, 0.0, 0.0,
				cy, 0.0, -sy, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4NumberX(16), result.raw_data, raw_y));
		}
		if(rz_deg != 0.0){
			var rz_rad:Number = rz_deg * S3DConst.DEG_2_RAD;
			var sz:Number = Math.sin(rz_rad);
			var cz:Number = Math.cos(rz_rad);
			var raw_z:Vector.<Number> = Vector.<Number>([
				cz, sz, 0.0, 0.0,
				-sz, cz, 0.0, 0.0,
				0.0, 0.0, 1.0, 0.0,
				0.0, 0.0, 0.0, 1.0
			]);
			s3d_matrixCopyFromRawData(result, s3d_matrixMultiplicationInRawData(S3DUtils.Vector4NumberX(16), result.raw_data, raw_z));
		}
		
		return result;
	}
}