package s3d_context{
	import s3d_camera.s3d_cameraExportMatrix4Camera;
	import s3d_camera.s3d_cameraExportMatrix4Projection;
	import s3d_camera.s3d_cameraExportMatrix4Screen;
	
	import s3d_display.s3d_displayExportMatrix4Object;
	import s3d_display.s3d_displayExportMatrix4World;
	
	import s3d_matrix.s3d_matrixMultiplication2Matrix;
	
	import s3d_misc.S3DConst;
	import s3d_misc.S3DUtils;
	import s3d_misc.s3d_batchMatrixMultiplication;
	import s3d_misc.s3d_perspectiveDivision;
	
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;
	import s3d_struct.S3DMatrix;

	public function s3d_contextElapse(context:S3DContext, delta_time:Number):void{
		context.cumulative_time += delta_time;
		if(context.cumulative_time < context.frame_rate){
			return;
		}
		context.cumulative_time = 0.0;
			
		var m_world:S3DMatrix;
		var m_camera:S3DMatrix;
		var m_projection:S3DMatrix;
		var m_screen:S3DMatrix;
		
		var head:S3DDisplayObject = context.head;
		var next:S3DDisplayObject = context.head.nxt;
		while(head != next){
			m_world = s3d_matrixMultiplication2Matrix(S3DUtils.ZeroMatrix(), s3d_displayExportMatrix4Object(next), s3d_displayExportMatrix4World(next));
			s3d_batchMatrixMultiplication(next.vertex_raw_data4world, next.vertex_raw_data, m_world.raw_data, 4);
			
			m_camera = s3d_cameraExportMatrix4Camera(context.camera);
			s3d_batchMatrixMultiplication(next.vertex_raw_data4camera, next.vertex_raw_data4world, m_camera.raw_data, 4);
			
			m_projection = s3d_cameraExportMatrix4Projection(context.camera);
			s3d_batchMatrixMultiplication(next.vertex_raw_data4final, next.vertex_raw_data4camera, m_projection.raw_data, 4);
			s3d_perspectiveDivision(next.vertex_raw_data4final, 4);
			
			m_screen = s3d_cameraExportMatrix4Screen(context.camera);
			s3d_batchMatrixMultiplication(next.vertex_raw_data4final, next.vertex_raw_data4final, m_screen.raw_data, 4);
			
			next = next.nxt;
		}
		
		s3d_contextClear(context);
		
		if(S3DConst.RENDER_TYPE_WIRE == context.render_type){
			s3d_contextRenderWire(context,0, 2);
		}else if(S3DConst.RENDER_TYPE_SOLID == context.render_type){
			s3d_contextRenderSolid(context,0, 2);
		}
	}
}