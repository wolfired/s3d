package s3d_matrix{
	import s3d_struct.S3DMatrix;

	public function s3d_matrixCopyRowFromRawData(dst:S3DMatrix, row:uint, raw_data:Vector.<Number>):S3DMatrix{
		var idx:uint = row * 4;
		dst.raw_data[idx + 0] = raw_data[0];
		dst.raw_data[idx + 1] = raw_data[1];
		dst.raw_data[idx + 2] = raw_data[2];
		dst.raw_data[idx + 3] = raw_data[3];
		return dst;
	}
}