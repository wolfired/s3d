package s3d_make{
	import s3d_matrix.s3d_matrixCopyFromRawData;
	
	import s3d_struct.S3DMatrix;

	public function s3d_makeMatrix(raw_data:Vector.<Number>):S3DMatrix{
		var result:S3DMatrix = new S3DMatrix();
		s3d_matrixCopyFromRawData(result, raw_data);
		return result;
	}
}