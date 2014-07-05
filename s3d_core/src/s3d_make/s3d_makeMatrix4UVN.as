package s3d_make{
	import s3d_matrix.s3d_matrixCopyColumnFromVector;
	import s3d_matrix.s3d_matrixCopyRowFromVector;
	
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;
	
	import s3d_vector.s3d_vectorCrossProduct2Vector;
	import s3d_vector.s3d_vectorDotProduct;
	import s3d_vector.s3d_vectorNormalize;

	public function s3d_makeMatrix4UVN(camera:S3DCamera):S3DMatrix{
		var result:S3DMatrix = S3DUtils.ZeroMatrix();
		
		var t:S3DVector = s3d_makeVector(camera.point_at.x, camera.point_at.y, camera.point_at.z);
		
		var n:S3DVector = s3d_makeVector(camera.point_to.x - camera.point_at.x, camera.point_to.y - camera.point_at.y, camera.point_to.z - camera.point_at.z);
		s3d_vectorNormalize(n);
		var u:S3DVector = s3d_vectorCrossProduct2Vector(new S3DVector(), camera.up_vector, n);
		s3d_vectorNormalize(u);
		var v:S3DVector = s3d_vectorCrossProduct2Vector(new S3DVector(), n, u);
		
		var tx:Number = - s3d_vectorDotProduct(t, u);
		var ty:Number = - s3d_vectorDotProduct(t, v);
		var tz:Number = - s3d_vectorDotProduct(t, n);
		var tt:S3DVector = s3d_makePoint(tx, ty, tz);
		
		s3d_matrixCopyColumnFromVector(result, 0, u);
		s3d_matrixCopyColumnFromVector(result, 1, v);
		s3d_matrixCopyColumnFromVector(result, 2, n);
		s3d_matrixCopyRowFromVector(result, 3, tt);
		
		return result;
	}
}