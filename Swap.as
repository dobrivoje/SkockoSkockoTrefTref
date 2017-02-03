class Swap {
	var src:Number,
		dst:Number;

	public function Swap(src:Number, dst:Number) {
		this.src=src;
		this.dst=dst;
	}
	public function zameni():Void {
		var tmp:Number=this.src;
		this.src=this.dst;
		this.dst=tmp;
	}
	public static function zameni2(x:Number, y:Number):Void {
		var tmp:Number=x.valueOf();
		x=y.valueOf();
		y=tmp.valueOf();
	}
	public static function zameni3(src:Array, dest:Array):Void {	
		var tmp:Array;
		tmp=src;
		src=dest;
		dest=tmp;
	}
	public static function howManyGuessed(g:Array,m:Array):Number { 		// koliko smo pogodili ukupno
		var overAll:Number=0;
		for(var i:Number=0;i<6;i++) {
			if(g[i]>0 and not g[i].isNaN) {
				for(var j:Number=0;j<6;j++) {
					if(m[j]>0 and not m[i].isNaN) {
						if(i==j) {
							overAll+=Math.min(m[j],g[i]);
						}
					}
				}
			}
		}
		return overAll;
	}
}