package s3d_context{
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DBuffer4Index;
	import s3d_struct.S3DContext;

	public function s3d_contextCreateBuffer4Index(context:S3DContext, index_count:uint):S3DBuffer4Index{
		var result:S3DBuffer4Index = new S3DBuffer4Index();
		result.raw_data = S3DUtils.Vector4uintX(index_count);
		
		if(null == context.index_buffer_linked_list){
			context.index_buffer_linked_list = result;
		}else{
			context.index_buffer_linked_list.nxt = result;
			result.pre = context.index_buffer_linked_list;
		}
		
		return result;
	}
}