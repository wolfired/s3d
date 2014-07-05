package s3d_misc{
	import s3d_make.s3d_makeMatrix;
	import s3d_make.s3d_makePoint;
	import s3d_make.s3d_makeVector;
	
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DVector;

	public class S3DUtils{
		public static function Vector4Number16():Vector.<Number>{
			return new Vector.<Number>(16, true);
		}
		
		public static function Vector4Number4():Vector.<Number>{
			return new Vector.<Number>(4, true);
		}
		
		public static function ZeroVector():S3DVector{
			return s3d_makeVector(0.0, 0.0, 0.0);
		}
		
		public static function RightVector():S3DVector{
			return s3d_makeVector(1.0, 0.0, 0.0);
		}
		
		public static function UpVector():S3DVector{
			return s3d_makeVector(0.0, 1.0, 0.0);
		}
		
		public static function FrontVector():S3DVector{
			return s3d_makeVector(0.0, 0.0, 1.0);
		}
		
		public static function ZeroMatrix():S3DMatrix{
			return s3d_makeMatrix(S3DConst.ZERO_MATRIX_RAW_DATA);
		}
		
		public static function IdentityMatrix():S3DMatrix{
			return s3d_makeMatrix(S3DConst.IDENTITY_MATRIX_RAW_DATA);
		}
		
		public static function OriginPoint():S3DVector{
			return s3d_makePoint(0.0, 0.0, 0.0);
		}
	}
}
