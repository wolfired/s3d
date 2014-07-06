package s3d_misc{
	public function s3d_raw2raw4Number(dst_raw_data:Vector.<Number>, src_raw_data:Vector.<Number>):void{
		var len:uint = src_raw_data.length;
		for (var i:int = 0; i < len; ++i) {
			dst_raw_data[i] = src_raw_data[i];
		}
	}
}