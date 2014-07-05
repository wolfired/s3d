package s3d_context{
	import s3d_struct.S3DModel;

	public function s3d_contextDraw(model:S3DModel):void{
		var f:uint;
		var s:uint;
		var t:uint;
		for (var i:uint = 0; i < model.index_raw_data.length; i += 3) {
			f = model.index_raw_data[i + 0];
			s = model.index_raw_data[i + 1];
			t = model.index_raw_data[i + 2];
			
			context_s3d.graphics.moveTo(model.screen[f * 4 + 0], model.screen[f * 4 + 1]);
			context_s3d.graphics.lineTo(model.screen[s * 4 + 0], model.screen[s * 4 + 1]);
			context_s3d.graphics.lineTo(model.screen[t * 4 + 0], model.screen[t * 4 + 1]);
			context_s3d.graphics.lineTo(model.screen[f * 4 + 0], model.screen[f * 4 + 1]);
		}
	}
}