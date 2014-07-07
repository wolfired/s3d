package s3d_struct{
	import s3d_misc.S3DUtils;

	public class S3DVector{
		public const raw_data:Vector.<Number> = S3DUtils.Vector4NumberX(4);
		
		public function get x():Number { return raw_data[0]; }
		public function set x(value:Number):void{
			raw_data[0] = value;
		}
		
		public function get y():Number { return raw_data[1]; }
		public function set y(value:Number):void{
			raw_data[1] = value;
		}
		
		public function get z():Number { return raw_data[2]; }
		public function set z(value:Number):void{
			raw_data[2] = value;
		}
		
		public function get w():Number { return raw_data[3]; }
		public function set w(value:Number):void{
			raw_data[3] = value;
		}
	}
}