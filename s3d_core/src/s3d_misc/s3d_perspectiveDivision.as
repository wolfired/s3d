package s3d_misc{
	import s3d_struct.S3DBuffer4Vertex;

	public function s3d_perspectiveDivision(vb:S3DBuffer4Vertex):void{
		var target:Vector.<Number> = vb.real_raw_data;
		for (var i:int = 0; i < target.length; i += vb.vertex_wide) {
			target[i + 0] /= target[i + 3];
			target[i + 1] /= target[i + 3];
			target[i + 2] /= target[i + 3];
			target[i + 3] /= target[i + 3];
		}
	}
}