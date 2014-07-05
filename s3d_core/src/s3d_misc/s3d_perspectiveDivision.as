package s3d_misc{
	public function s3d_perspectiveDivision(target:Vector.<Number>):void{
		for (var i:int = 0; i < target.length; i += 4) {
			target[i + 0] /= target[i + 3];
			target[i + 1] /= target[i + 3];
			target[i + 2] /= target[i + 3];
			target[i + 3] /= target[i + 3];
		}
	}
}