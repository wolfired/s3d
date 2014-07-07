package s3d_display{
	import s3d_struct.S3DDisplayObject;

	public function s3d_displayRotateTo(target:S3DDisplayObject, rx_deg:Number, ry_deg:Number, rz_deg:Number):void{
		target.rx_deg = rx_deg;
		target.ry_deg = ry_deg;
		target.rz_deg = rz_deg;
		
		target.objectMatrixInvalid = true;
	}
}