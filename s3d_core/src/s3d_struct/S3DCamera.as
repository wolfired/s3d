package s3d_struct{
	public class S3DCamera{
		public var point_at:S3DVector;
		public var point_to:S3DVector;
		public var up_vector:S3DVector;
		
		public var fovx:Number = 90.0;
		
		public var near:Number = 0.1;
		public var far:Number = 1000.0;
		
		public var view_port_width:Number = 100.0;
		public var view_port_height:Number = 100.0;
		public var aspectRatio:Number = 1.0;
	}
}