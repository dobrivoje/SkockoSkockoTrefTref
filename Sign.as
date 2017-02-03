class Sign extends MovieClip
{
	public var sign:Number=0; // znak
	public static var allSigns:Boolean=false;	// =true, ako su sva 4 izabrana,
	private static var active:Number=0; 		// broj selektovanih znakova, ako su sva 4, onda je true
	var signSelected:Boolean=false; 			// znak odabran ?
	
	/* 	sign = reprezentacija znaka:
	
	1 = znak NIJE izabran, tj. na TimeLine-u je to 0-ti frame !!!
	2 = pik, 
	3 = tref, 
	4 = karo, 
	5 = srce, 
	6 = duga, 
	7 = kocka 
	
	*/	
	public function init():Void { //inicijalizuj varijable !!
		sign=1;   				  //služi nam za premotavanje 
		allSigns=false; 		  // movie-a na početak, tj. na frame 1 !!
	 	active=0;
		signSelected=false; 
	}
	public function Sign() {
		this.init();
	}
	public function generate():Void {
		sign=Math.floor(6*Math.random(1)+1)+1;
		// dodaje se na kraju jos jedan "1", jer drugi frame je pik, treci tref,itd..
		// metod generate generiše slučajne brojeve od 2..7
	}
	public function clickNext():Void {
		sign=(++sign)%8;
		if(sign<1 or sign>7) sign=2;
		
		if(sign>1 and signSelected==false) {
			signSelected=true;
			active++;
		}
		else 
			if(sign==0) {
				signSelected=false;
				active--;
		}
		
		if(active==4) {
			allSigns=true;
		}
		else
			allSigns=false;
	}
	
	public static function getAllSigns():Boolean {
		return allSigns;
	}
	public static function getActive():Number {
		return active;
	}
}