package{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import s3d_camera.s3d_cameraExportCameraMatrix;
	import s3d_camera.s3d_cameraExportProjectionMatrix;
	import s3d_camera.s3d_cameraExportScreenMatrix;
	
	import s3d_context.context_s3d;
	import s3d_context.s3d_contextClear;
	import s3d_context.s3d_contextDraw;
	
	import s3d_make.s3d_makeCamera;
	import s3d_make.s3d_makeContext;
	import s3d_make.s3d_makeMatrix4Rotation;
	import s3d_make.s3d_makeMatrix4Scale;
	import s3d_make.s3d_makeMatrix4Translation;
	import s3d_make.s3d_makePoint;
	
	import s3d_matrix.s3d_matrixMultiplication;
	import s3d_matrix.s3d_matrixMultiplication2Matrix;
	import s3d_matrix.s3d_matrixMultiplicationInRawData;
	
	import s3d_misc.S3DUtils;
	import s3d_misc.s3d_perspectiveDivision;
	
	import s3d_struct.S3DCamera;
	import s3d_struct.S3DMatrix;
	import s3d_struct.S3DModel;
	
	[SWF(width="400", height="400", frameRate="60")]
	public class S3DMain extends Sprite{
		public function S3DMain(){
			if(this.stage){
				this.startup();
			}else{
				this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			}
		}
		
		private function onAddToStage(event:Event):void{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			this.startup();
		}
		
		private function startup():void{
			this.stage.align = StageAlign.TOP;
			this.stage.quality = StageQuality.BEST;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			trace("startup");
			
			context_s3d = s3d_makeContext(graphics, 1 / 24.0);
			var c:S3DCamera = s3d_makeCamera(S3DUtils.OriginPoint(), s3d_makePoint(0, 0, 1), S3DUtils.UpVector(), 120, 0.1, 1000, 400, 400);
			
			var model:S3DModel = new S3DModel();
			model.vertex_raw_data = Vector.<Number>([
				1, 1, 1, 1,
				1, -1, 1, 1,
				-1, -1, 1, 1,
				-1, 1, 1, 1
			]);
			model.index_raw_data = Vector.<uint>([
				0, 1, 2,
				0, 2, 3
			]);
			
			this.addEventListener(Event.ENTER_FRAME, function(event:Event):void{
//				var mr:S3DMatrix = s3d_makeMatrix4Rotation(0, 0, 0);
				var mr:S3DMatrix = s3d_makeMatrix4Rotation(0, 0, getTimer()/50);
				var ms:S3DMatrix = s3d_makeMatrix4Scale(1, 1, 1);
				var mt:S3DMatrix = s3d_makeMatrix4Translation(0, 0, 2);
				s3d_matrixMultiplication(mr, ms);
				s3d_matrixMultiplication(mr, mt);
				model.world = s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), model.vertex_raw_data, mr.raw_data);
				
				var m_camera:S3DMatrix = s3d_cameraExportCameraMatrix(c);
				var m_projection:S3DMatrix = s3d_cameraExportProjectionMatrix(c);
				var m_screen:S3DMatrix = s3d_cameraExportScreenMatrix(c);
				
				var mcc:S3DMatrix = s3d_matrixMultiplication2Matrix(S3DUtils.ZeroMatrix(), m_camera, s3d_makeMatrix4Rotation(0, 0, 0));
				model.camera = s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), model.world, mcc.raw_data);
				
				model.project = s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), model.camera, m_projection.raw_data);
				s3d_perspectiveDivision(model.project);
				model.screen = s3d_matrixMultiplicationInRawData(S3DUtils.Vector4Number16(), model.project, m_screen.raw_data);
				
				s3d_contextClear();
				s3d_contextDraw(model);
			});
			
			trace("endup");
		}
		
	}
}