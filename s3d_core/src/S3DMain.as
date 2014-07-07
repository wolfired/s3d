package{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import s3d_camera.s3d_cameraResetViewPort;
	
	import s3d_context.s3d_contextAddDisplayObject;
	import s3d_context.s3d_contextElapse;
	
	import s3d_display.s3d_displayMoveTo;
	import s3d_display.s3d_displayRotateTo;
	
	import s3d_make.s3d_makeCamera;
	import s3d_make.s3d_makeContext;
	import s3d_make.s3d_makeDisplayObject;
	import s3d_make.s3d_makePoint;
	
	import s3d_misc.S3DUtils;
	
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;
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
		
		private var context:S3DContext;
		private var obj0:S3DDisplayObject;
		private var obj1:S3DDisplayObject;
		
		private function startup():void{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.quality = StageQuality.BEST;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.stage.addEventListener(Event.RESIZE, onResize);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
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
			
			obj0 = s3d_makeDisplayObject(model);
			s3d_displayMoveTo(obj0, -2, 0, 5);
			s3d_displayRotateTo(obj0, 0, 0, 45);
			s3d_contextAddDisplayObject(context, obj0);
			
			obj1 = s3d_makeDisplayObject(model);
			s3d_displayMoveTo(obj1, 2, 0, 5);
			s3d_displayRotateTo(obj1, 0, 45, 0);
			s3d_contextAddDisplayObject(context, obj1);
			
			trace("endup");
		}
		
		private function onKeyDown(event:KeyboardEvent):void{
		}
		
		private function onResize(event:Event):void{
			s3d_cameraResetViewPort(context.camera, this.stage.stageWidth, this.stage.stageHeight);
		}
		
		private function onEnterFrame(event:Event):void{
			s3d_contextElapse(context, 1/60);
		}
	}
}