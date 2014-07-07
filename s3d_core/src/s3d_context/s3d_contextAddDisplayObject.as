package s3d_context{
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;

		public function s3d_contextAddDisplayObject(context:S3DContext, display_object:S3DDisplayObject):void{
			context.head.pre.nxt = display_object;
			display_object.pre = context.head.pre;
			display_object.nxt = context.head;
			context.head.pre = display_object;
		}
}