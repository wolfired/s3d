package s3d_context{
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;

	public function s3d_contextRenderWire(context:S3DContext, start_triangle:uint, count_triangle:uint):void{
		var vertex_raw_data:Vector.<Number>;
		var index_raw_data:Vector.<uint>;
		
		var head:S3DDisplayObject = context.head;
		var next:S3DDisplayObject = context.head.nxt;
		while(head != next){
			vertex_raw_data = next.vertex_raw_data4final;
			index_raw_data = next.index_raw_data;
			
			var f:uint;
			var s:uint;
			var t:uint;
			for (var i:uint = 0; i < index_raw_data.length; i += 3) {
				f = index_raw_data[i + 0];
				s = index_raw_data[i + 1];
				t = index_raw_data[i + 2];
				
				context.graphics.moveTo(vertex_raw_data[f * 4 + 0], vertex_raw_data[f * 4 + 1]);
				context.graphics.lineTo(vertex_raw_data[s * 4 + 0], vertex_raw_data[s * 4 + 1]);
				context.graphics.lineTo(vertex_raw_data[t * 4 + 0], vertex_raw_data[t * 4 + 1]);
				context.graphics.lineTo(vertex_raw_data[f * 4 + 0], vertex_raw_data[f * 4 + 1]);
			}
			
			next = next.nxt;
		}
	}
}