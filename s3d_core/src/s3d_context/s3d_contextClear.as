package s3d_context{
	import s3d_struct.S3DContext;

	public function s3d_contextClear(context:S3DContext):void{
		context.graphics.clear();
		context.graphics.lineStyle(1, 0x000000);
	}
}