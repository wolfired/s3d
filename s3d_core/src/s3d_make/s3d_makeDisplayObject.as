package s3d_make{
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DDisplayObject;
	import s3d_struct.S3DModel;

	public function s3d_makeDisplayObject(model:S3DModel):S3DDisplayObject{
		var result:S3DDisplayObject = new S3DDisplayObject();
		
		result.vertex_raw_data = model.vertex_raw_data;
		var len:uint = model.vertex_raw_data.length;
		result.vertex_raw_data4world = S3DUtils.Vector4NumberX(len);
		result.vertex_raw_data4camera = S3DUtils.Vector4NumberX(len);
		result.vertex_raw_data4final = S3DUtils.Vector4NumberX(len);
		
		result.index_raw_data = model.index_raw_data;
		
		result.x = result.y = result.x = 0.0;
		result.rx_deg = result.ry_deg = result.rx_deg = 0.0;
		result.sx = result.sy = result.sx = 1.0;
		
		return result;
	}
}