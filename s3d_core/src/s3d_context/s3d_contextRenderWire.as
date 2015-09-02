package s3d_context {

	import flash.geom.Point;
	import flash.geom.Rectangle;
	import s3d_struct.S3DContext;
	import s3d_struct.S3DDisplayObject;

	public function s3d_contextRenderWire(context:S3DContext, start_triangle:uint, count_triangle:uint):void {
		context.old_graphics.position = 0;
		context.graphics.setPixels(new Rectangle(0, 0, context.graphics.width, context.graphics.height), context.old_graphics);

		var vertex_raw_data:Vector.<Number>;
		var index_raw_data:Vector.<uint>;

		var head:S3DDisplayObject = context.head;
		var next:S3DDisplayObject = context.head.nxt;

		while(head != next) {
			vertex_raw_data = next.vertex_raw_data4final;
			index_raw_data = next.index_raw_data;

			var f:uint;
			var s:uint;
			var t:uint;

			for(var i:uint = 0; i < index_raw_data.length; i += 3) {
				f = index_raw_data[i + 0];
				s = index_raw_data[i + 1];
				t = index_raw_data[i + 2];

				line(context.graphics, new Point(vertex_raw_data[f * 4 + 0], vertex_raw_data[f * 4 + 1]), new Point(vertex_raw_data[s * 4 + 0], vertex_raw_data[s * 4 + 1]));
				line(context.graphics, new Point(vertex_raw_data[s * 4 + 0], vertex_raw_data[s * 4 + 1]), new Point(vertex_raw_data[t * 4 + 0], vertex_raw_data[t * 4 + 1]));
				line(context.graphics, new Point(vertex_raw_data[t * 4 + 0], vertex_raw_data[t * 4 + 1]), new Point(vertex_raw_data[f * 4 + 0], vertex_raw_data[f * 4 + 1]));
			}

			next = next.nxt;
		}
	}
}

import flash.display.BitmapData;
import flash.geom.Point;

function line(target:BitmapData, pos0:Point, pos1:Point):void {
	var a:Number = (pos0.y - pos1.y) / (pos0.x - pos1.x);
	var b:Number = pos0.y - a * pos0.x;

	var step:int;
	var end:int;

	if(Math.abs(a) > 1 || a == Infinity || a == -Infinity) {
		if(pos0.y <= pos1.y) {
			step = pos0.y;
			end = pos1.y;
		} else {
			step = pos1.y;
			end = pos0.y;
		}
	} else {
		if(pos0.x <= pos1.x) {
			step = pos0.x;
			end = pos1.x;
		} else {
			step = pos1.x;
			end = pos0.x;
		}
	}

	target.lock();

	var count:uint = 0;

	for(; step <= end; ++step) {
		if(a == Infinity || a == -Infinity){
			target.setPixel32(pos0.x, step, 0xFFFF0000);
		}else if(Math.abs(a) > 1) {
			target.setPixel32((step - b) / a, step, 0xFFFF0000);
		} else {
			target.setPixel32(step, a * step + b, 0xFFFF0000);
		}

//		target.setPixel32(step, a * step + b, this.getTex(step, a * step + b));
		++count;
	}
//	trace(count);

	target.unlock();
}
