package s3d_make{
	import flash.display.Graphics;
	
	import s3d_struct.S3DContext;

		public function s3d_makeContext(graphics:Graphics, frame_rate:Number):S3DContext{
			var result:S3DContext = new S3DContext();
			result.graphics = graphics;
			result.frame_rate = frame_rate;
			return result;
		}
}