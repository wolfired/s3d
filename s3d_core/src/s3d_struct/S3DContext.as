package s3d_struct{
	import flash.display.Graphics;

	public class S3DContext{
		public var render_type:uint;
		
		public var cumulative_time:Number;
		public var frame_rate:Number;
		
		
		public var graphics:Graphics;
		public var camera:S3DCamera;
		
		public var head:S3DDisplayObject;
	}
}