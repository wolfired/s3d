package s3d_make{
	import flash.display.Graphics;
	
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;

		public function s3d_makeContext(graphics:Graphics, frame_rate:Number):S3DContext{
			var result:S3DContext = new S3DContext();
			result.graphics = graphics;
			result.frame_rate = frame_rate;
			result.head = new S3DDisplayObject();
			result.head.pre = result.head;
			result.head.nxt = result.head;
			return result;
		}
}