package s3d_context{
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DBuffer4Vertex;
	import s3d_struct.S3DContext;

	public function s3d_contextCreateBuffer4Vertex(context:S3DContext, vertex_count:uint, vertex_wide:uint):S3DBuffer4Vertex{
		var result:S3DBuffer4Vertex = new S3DBuffer4Vertex();
		result.vertex_wide = vertex_wide;
		result.original_raw_data = S3DUtils.Vector4NumberX(vertex_count * vertex_wide);
		result.real_raw_data = S3DUtils.Vector4NumberX(vertex_count * vertex_wide);
		
		if(null == context.vertex_buffer_linked_list){
			context.vertex_buffer_linked_list = result;
		}else{
			context.vertex_buffer_linked_list.nxt = result;
			result.pre = context.vertex_buffer_linked_list;
		}
		
		return result;
	}
}
