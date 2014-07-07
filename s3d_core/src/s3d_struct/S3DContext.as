package s3d_struct{
	import flash.display.Graphics;

	public class S3DContext{
		public var state:uint;
		
		public var graphics:Graphics;
		public var frame_rate:Number;
		public var camera:S3DCamera;
		
		public var head:S3DDisplayObject;
	}
}