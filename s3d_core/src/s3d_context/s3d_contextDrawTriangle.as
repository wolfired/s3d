package s3d_context{
	import s3d_struct.S3DBuffer4Index;
	import s3d_struct.S3DBuffer4Vertex;
	import s3d_struct.S3DContext;
	

	public function s3d_contextDrawTriangle(context:S3DContext, start_triangle:uint, count_triangle:uint):void{
		var vb:S3DBuffer4Vertex;
		var vertex_raw_data:Vector.<Number>;
		var ib:S3DBuffer4Index;
		var index_raw_data:Vector.<uint>;
		while(true){
			vb = context.vertex_buffer_linked_list;
			ib = context.index_buffer_linked_list;
			if(null == vb || null == ib){
				break;
			}
			vertex_raw_data = vb.real_raw_data;
			index_raw_data = ib.raw_data;
			
			var f:uint;
			var s:uint;
			var t:uint;
			for (var i:uint = 0; i < index_raw_data.length; i += 3) {
				f = index_raw_data[i + 0];
				s = index_raw_data[i + 1];
				t = index_raw_data[i + 2];
				
				context.graphics.moveTo(vertex_raw_data[f * vb.vertex_wide + 0], vertex_raw_data[f * vb.vertex_wide + 1]);
				context.graphics.lineTo(vertex_raw_data[s * vb.vertex_wide + 0], vertex_raw_data[s * vb.vertex_wide + 1]);
				context.graphics.lineTo(vertex_raw_data[t * vb.vertex_wide + 0], vertex_raw_data[t * vb.vertex_wide + 1]);
				context.graphics.lineTo(vertex_raw_data[f * vb.vertex_wide + 0], vertex_raw_data[f * vb.vertex_wide + 1]);
			}
			
			if(null == vb.nxt || null == ib.nxt){
				break;
			}
		}
	}
}