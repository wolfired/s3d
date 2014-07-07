package s3d_display{
	import s3d_struct.S3DDisplayObject;

		public function s3d_displayMoveTo(target:S3DDisplayObject, x:Number, y:Number, z:Number):void{
			target.x = x;
			target.y = y;
			target.z = z;
			
			target.worldMatrixInvalid = true;
		}
}