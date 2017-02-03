class Mover extends MovieClip {
	public var sign:Number;
	/* 	sign = broj znaka:
		1=pik, 2=tref, 3=karo, 4=srce, 5=duga, 6=skočko */		
	function Mover() {
		sign=0;
	}
	function click():Void{
		sign=(++sign)%6;
	}
}