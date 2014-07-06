package s3d_buffer{
	import s3d_misc.s3d_raw2raw4uint;
	
	import s3d_struct.S3DBuffer4Index;

	public function s3d_bufferUploadIndex(buffer:S3DBuffer4Index, raw_data:Vector.<uint>):void{
		s3d_raw2raw4uint(buffer.raw_data, raw_data);
	}
}