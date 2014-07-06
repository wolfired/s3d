package s3d_buffer{
	import s3d_misc.s3d_raw2raw4Number;
	
	import s3d_struct.S3DBuffer4Vertex;

	public function s3d_bufferUploadVertex(buffer:S3DBuffer4Vertex, raw_data:Vector.<Number>):void{
		s3d_raw2raw4Number(buffer.original_raw_data, raw_data);
	}
}