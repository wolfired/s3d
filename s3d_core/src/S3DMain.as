package{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.utils.getTimer;
	
	import s3d_camera.s3d_cameraExportMatrix4Camera;
	import s3d_camera.s3d_cameraExportMatrix4Projection;
	import s3d_camera.s3d_cameraExportMatrix4Screen;
	import s3d_camera.s3d_cameraResetViewPort;
	
	import s3d_context.s3d_contextAddDisplayObject;
	import s3d_context.s3d_contextClear;
	import s3d_context.s3d_contextDrawTriangle;
	
	import s3d_display.s3d_displayExportMatrix4Object;
	import s3d_display.s3d_displayExportMatrix4World;
	import s3d_display.s3d_displayMoveTo;
	import s3d_display.s3d_displayRotateTo;
	
	import s3d_make.s3d_makeCamera;
	import s3d_make.s3d_makeContext;
	import s3d_make.s3d_makeDisplayObject;
	import s3d_make.s3d_makePoint;
	
	import s3d_matrix.s3d_matrixMultiplication2Matrix;
	
	import s3d_misc.S3DUtils;
	import s3d_misc.s3d_perspectiveDivision;
	
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;
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
		
		private function onKeyDown(event:KeyboardEvent):void{
//			s3d_cameraRotation(context.camera, 0, 0, 10);
//			s3d_cameraTranslation(context.camera, 0.1, 0, 0);
		}
		
		private function onResize(event:Event):void{
			s3d_cameraResetViewPort(context.camera, this.stage.stageWidth, this.stage.stageHeight);
		}
		
		private var context:S3DContext;
		
		private function startup():void{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.quality = StageQuality.BEST;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.stage.addEventListener(Event.RESIZE, onResize);
			
			trace("startup");
			
			context = s3d_makeContext(graphics, 1 / 24.0);
			context.camera = s3d_makeCamera(S3DUtils.OriginPoint(), s3d_makePoint(0, 0, 1), S3DUtils.UpVector(), 90, 0.1, 1000, this.stage.stageWidth, this.stage.stageHeight);
			
			var model:S3DModel = new S3DModel();
			model.vertex_raw_data = Vector.<Number>([
				1, 1, 1, 1,
				1, -1, 1, 1,
				-1, -1, 1, 1,
				-1, 1, 1, 1,
				1, 1, -1, 1,
				1, -1, -1, 1,
				-1, -1, -1, 1,
				-1, 1, -1, 1
			]);
			model.index_raw_data = Vector.<uint>([
				0, 1, 2,
				0, 2, 3,
				4, 5, 6,
				4, 6, 7,
				0, 1, 5,
				0, 5, 4,
				3, 2, 6,
				3, 6, 7,
				0, 4, 7,
				0, 7, 3,
				1, 5, 6,
				1, 6, 2
			]);
			
			var obj0:S3DDisplayObject = s3d_makeDisplayObject(model);
			s3d_displayMoveTo(obj0, -2, 0, 5);
//			s3d_displayRotateTo(obj0, 0, 0, 0);
			s3d_contextAddDisplayObject(context, obj0);
			
			var obj1:S3DDisplayObject = s3d_makeDisplayObject(model);
			s3d_displayMoveTo(obj1, 2, 0, 5);
			s3d_displayRotateTo(obj1, 0, 45, 0);
			s3d_contextAddDisplayObject(context, obj1);
			
			this.addEventListener(Event.ENTER_FRAME, function(event:Event):void{
				s3d_displayRotateTo(obj0, 0, 0, getTimer()/60);
				s3d_displayRotateTo(obj1, 0, 0, getTimer()/60);
				
				var m_world:S3DMatrix;
				m_world = s3d_matrixMultiplication2Matrix(S3DUtils.ZeroMatrix(), s3d_displayExportMatrix4Object(obj0), s3d_displayExportMatrix4World(obj0));;
				func(obj0.vertex_raw_data4world, obj0.vertex_raw_data, m_world.raw_data, 4);
				m_world = s3d_matrixMultiplication2Matrix(S3DUtils.ZeroMatrix(), s3d_displayExportMatrix4Object(obj1), s3d_displayExportMatrix4World(obj1));;
				func(obj1.vertex_raw_data4world, obj1.vertex_raw_data, m_world.raw_data, 4);
				
				var m_camera:S3DMatrix = s3d_cameraExportMatrix4Camera(context.camera);
				func(obj0.vertex_raw_data4camera, obj0.vertex_raw_data4world, m_camera.raw_data, 4);
				func(obj1.vertex_raw_data4camera, obj1.vertex_raw_data4world, m_camera.raw_data, 4);
				
				var m_projection:S3DMatrix = s3d_cameraExportMatrix4Projection(context.camera);
				func(obj0.vertex_raw_data4final, obj0.vertex_raw_data4camera, m_projection.raw_data, 4);
				s3d_perspectiveDivision(obj0.vertex_raw_data4final, 4);
				func(obj1.vertex_raw_data4final, obj1.vertex_raw_data4camera, m_projection.raw_data, 4);
				s3d_perspectiveDivision(obj1.vertex_raw_data4final, 4);
				
				var m_screen:S3DMatrix = s3d_cameraExportMatrix4Screen(context.camera);
				func(obj0.vertex_raw_data4final, obj0.vertex_raw_data4final, m_screen.raw_data, 4);
				func(obj1.vertex_raw_data4final, obj1.vertex_raw_data4final, m_screen.raw_data, 4);
				
				s3d_contextClear(context);
				s3d_contextDrawTriangle(context,0, 2);
			});
			
			trace("endup");
		}
		
		private function func(dst_vertex_raw_data:Vector.<Number>, src_vertex_raw_data:Vector.<Number>, matrix_raw_data:Vector.<Number>, vertex_wide:uint):void{
			var vertex_raw_data_length:uint = src_vertex_raw_data.length;
			
			var step:uint = vertex_wide * 4;
			
			var row00:uint, row01:uint, row02:uint, row03:uint;
			var row10:uint, row11:uint, row12:uint, row13:uint;
			var row20:uint, row21:uint, row22:uint, row23:uint;
			var row30:uint, row31:uint, row32:uint, row33:uint;
			
			var dst:Vector.<Number> = S3DUtils.Vector4Number16();
			var left_raw_data:Vector.<Number> = src_vertex_raw_data;
			var right_raw_data:Vector.<Number> = matrix_raw_data;
			for (var i:int = 0; i < vertex_raw_data_length; i += step) {
				row00 = i + 0 * vertex_wide + 0;
				row01 = i + 0 * vertex_wide + 1;
				row02 = i + 0 * vertex_wide + 2;
				row03 = i + 0 * vertex_wide + 3;
				
				row10 = i + 1 * vertex_wide + 0;
				row11 = i + 1 * vertex_wide + 1;
				row12 = i + 1 * vertex_wide + 2;
				row13 = i + 1 * vertex_wide + 3;
				
				row20 = i + 2 * vertex_wide + 0;
				row21 = i + 2 * vertex_wide + 1;
				row22 = i + 2 * vertex_wide + 2;
				row23 = i + 2 * vertex_wide + 3;
				
				row30 = i + 3 * vertex_wide + 0;
				row31 = i + 3 * vertex_wide + 1;
				row32 = i + 3 * vertex_wide + 2;
				row33 = i + 3 * vertex_wide + 3;
				
				
				dst[0] = left_raw_data[row00] * right_raw_data[0] + left_raw_data[row01] * right_raw_data[4] + left_raw_data[row02] * right_raw_data[8] + left_raw_data[row03] * right_raw_data[12];
				dst[1] = left_raw_data[row00] * right_raw_data[1] + left_raw_data[row01] * right_raw_data[5] + left_raw_data[row02] * right_raw_data[9] + left_raw_data[row03] * right_raw_data[13];
				dst[2] = left_raw_data[row00] * right_raw_data[2] + left_raw_data[row01] * right_raw_data[6] + left_raw_data[row02] * right_raw_data[10] + left_raw_data[row03] * right_raw_data[14];
				dst[3] = left_raw_data[row00] * right_raw_data[3] + left_raw_data[row01] * right_raw_data[7] + left_raw_data[row02] * right_raw_data[11] + left_raw_data[row03] * right_raw_data[15];
				
				dst[4] = left_raw_data[row10] * right_raw_data[0] + left_raw_data[row11] * right_raw_data[4] + left_raw_data[row12] * right_raw_data[8] + left_raw_data[row13] * right_raw_data[12];
				dst[5] = left_raw_data[row10] * right_raw_data[1] + left_raw_data[row11] * right_raw_data[5] + left_raw_data[row12] * right_raw_data[9] + left_raw_data[row13] * right_raw_data[13];
				dst[6] = left_raw_data[row10] * right_raw_data[2] + left_raw_data[row11] * right_raw_data[6] + left_raw_data[row12] * right_raw_data[10] + left_raw_data[row13] * right_raw_data[14];
				dst[7] = left_raw_data[row10] * right_raw_data[3] + left_raw_data[row11] * right_raw_data[7] + left_raw_data[row12] * right_raw_data[11] + left_raw_data[row13] * right_raw_data[15];
				
				dst[8] = left_raw_data[row20] * right_raw_data[0] + left_raw_data[row21] * right_raw_data[4] + left_raw_data[row22] * right_raw_data[8] + left_raw_data[row23] * right_raw_data[12];
				dst[9] = left_raw_data[row20] * right_raw_data[1] + left_raw_data[row21] * right_raw_data[5] + left_raw_data[row22] * right_raw_data[9] + left_raw_data[row23] * right_raw_data[13];
				dst[10] = left_raw_data[row20] * right_raw_data[2] + left_raw_data[row21] * right_raw_data[6] + left_raw_data[row22] * right_raw_data[10] + left_raw_data[row23] * right_raw_data[14];
				dst[11] = left_raw_data[row20] * right_raw_data[3] + left_raw_data[row21] * right_raw_data[7] + left_raw_data[row22] * right_raw_data[11] + left_raw_data[row23] * right_raw_data[15];
				
				dst[12] = left_raw_data[row30] * right_raw_data[0] + left_raw_data[row31] * right_raw_data[4] + left_raw_data[row32] * right_raw_data[8] + left_raw_data[row33] * right_raw_data[12];
				dst[13] = left_raw_data[row30] * right_raw_data[1] + left_raw_data[row31] * right_raw_data[5] + left_raw_data[row32] * right_raw_data[9] + left_raw_data[row33] * right_raw_data[13];
				dst[14] = left_raw_data[row30] * right_raw_data[2] + left_raw_data[row31] * right_raw_data[6] + left_raw_data[row32] * right_raw_data[10] + left_raw_data[row33] * right_raw_data[14];
				dst[15] = left_raw_data[row30] * right_raw_data[3] + left_raw_data[row31] * right_raw_data[7] + left_raw_data[row32] * right_raw_data[11] + left_raw_data[row33] * right_raw_data[15];
			
				dst_vertex_raw_data[row00] = dst[0];
				dst_vertex_raw_data[row01] = dst[1];
				dst_vertex_raw_data[row02] = dst[2];
				dst_vertex_raw_data[row03] = dst[3];
				
				dst_vertex_raw_data[row10] = dst[4];
				dst_vertex_raw_data[row11] = dst[5];
				dst_vertex_raw_data[row12] = dst[6];
				dst_vertex_raw_data[row13] = dst[7];
				
				dst_vertex_raw_data[row20] = dst[8];
				dst_vertex_raw_data[row21] = dst[9];
				dst_vertex_raw_data[row22] = dst[10];
				dst_vertex_raw_data[row23] = dst[11];
				
				dst_vertex_raw_data[row30] = dst[12];
				dst_vertex_raw_data[row31] = dst[13];
				dst_vertex_raw_data[row32] = dst[14];
				dst_vertex_raw_data[row33] = dst[15];
			}
		}
	}
}