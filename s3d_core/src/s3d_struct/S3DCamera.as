package s3d_struct{
	public class S3DCamera{
		public var point_at:S3DVector;
		public var point_to:S3DVector;
		public var up_vector:S3DVector;
		
		public var fovx_deg:Number = 90.0;
		
		public var near:Number = 0.1;
		public var far:Number = 1000.0;
		
		public var view_port_width:Number = 100.0;
		public var view_port_height:Number = 100.0;
		public var aspectRatio:Number = 1.0;
		
		public var tx:Number = 0.0;
		public var ty:Number = 0.0;
		public var tz:Number = 0.0;
		public var rx_deg:Number = 0.0;
		public var ry_deg:Number = 0.0;
		public var rz_deg:Number = 0.0;
		
		public var cameraMatrix:S3DMatrix;
		public var cameraMatrixInvalid:Boolean = true;
		
		public var projectionMatrix:S3DMatrix;
		public var projectionMatrixInvalid:Boolean = true;
		
		public var screenMatrix:S3DMatrix;
		public var screenMatrixInvalid:Boolean = true;
	}
}
