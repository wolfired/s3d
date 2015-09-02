package s3d_make {

	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import s3d_misc.S3DConst;
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;

	public function s3d_makeContext(graphics:BitmapData, frame_rate:Number):S3DContext {

		var result:S3DContext = new S3DContext();
		result.render_type = S3DConst.RENDER_TYPE_WIRE;
		result.graphics = graphics;
		result.graphics.copyPixelsToByteArray(new Rectangle(0, 0, graphics.width, graphics.height), result.old_graphics);
		result.frame_rate = frame_rate;
		result.head = new S3DDisplayObject();
		result.head.pre = result.head;
		result.head.nxt = result.head;
		return result;
	}
}
