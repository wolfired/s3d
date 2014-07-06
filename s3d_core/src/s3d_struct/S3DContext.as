package s3d_struct{
	import flash.display.Graphics;

	public class S3DContext{
		public var state:uint;
		
		public var graphics:Graphics;
		public var frame_rate:Number;
		public var camera:S3DCamera;
		
		public var vertex_buffer_linked_list:S3DBuffer4Vertex;
		public var index_buffer_linked_list:S3DBuffer4Index;
	}
}