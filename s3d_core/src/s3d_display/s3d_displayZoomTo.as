package s3d_display{
	import s3d_struct.S3DDisplayObject;

	public function s3d_displayZoomTo(target:S3DDisplayObject, sx:Number, sy:Number, sz:Number):void{
		target.sx = sx;
		target.sy = sy;
		target.sz = sz;
		
		target.objectMatrixInvalid = true;
	}
}