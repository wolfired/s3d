package s3d_struct{
	public class S3DDisplayObject{
		public var vertex_raw_data:Vector.<Number>;
		public var vertex_raw_data4world:Vector.<Number>;
		public var vertex_raw_data4camera:Vector.<Number>;
		public var vertex_raw_data4final:Vector.<Number>;
		
		public var index_raw_data:Vector.<uint>;
		
		public var x:Number = 0.0;
		public var y:Number = 0.0;
		public var z:Number = 0.0;
		
		public var rx_deg:Number = 0.0;
		public var ry_deg:Number = 0.0;
		public var rz_deg:Number = 0.0;
		
		public var sx:Number = 1.0;
		public var sy:Number = 1.0;
		public var sz:Number = 1.0;
		
		public var objectMatrix:S3DMatrix;
		public var objectMatrixInvalid:Boolean = true;
		
		public var worldMatrix:S3DMatrix;
		public var worldMatrixInvalid:Boolean = true;
		
		public var pre:S3DDisplayObject;
		public var nxt:S3DDisplayObject;
	}
}