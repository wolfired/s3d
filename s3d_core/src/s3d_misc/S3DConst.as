package s3d_misc{
	public class S3DConst{
		public static const AXIS_X:uint = 0x1 << 0;
		public static const AXIS_Y:uint = 0x1 << 1;
		public static const AXIS_Z:uint = 0x1 << 2;
		
		public static const DEG_2_RAD:Number = Math.PI / 180.0;
		public static const RAD_2_DEG:Number = 180.0 / Math.PI;
		
		public static const RENDER_TYPE_WIRE:uint = 0x1 << 0;
		public static const RENDER_TYPE_SOLID:uint = 0x1 << 1;
		
		public static const ZERO_MATRIX_RAW_DATA:Vector.<Number> = Vector.<Number>([
			0.0, 0.0, 0.0, 0.0,
			0.0, 0.0, 0.0, 0.0,
			0.0, 0.0, 0.0, 0.0,
			0.0, 0.0, 0.0, 0.0
		]);
		
		public static const IDENTITY_MATRIX_RAW_DATA:Vector.<Number> = Vector.<Number>([
			1.0, 0.0, 0.0, 0.0,
			0.0, 1.0, 0.0, 0.0,
			0.0, 0.0, 1.0, 0.0,
			0.0, 0.0, 0.0, 1.0
		]);
	}
}
