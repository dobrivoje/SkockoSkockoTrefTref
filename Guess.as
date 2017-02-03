class Guess
{
	var myComb:Array; 			// kopija naše kombinacije
	var givenComb:Array; 		// kopija zadate kombinacije
				
	// u myCombSigns[X], gde je X, kod znaka, stavljamo koliko se neki znak X
	// pojavio puta u zadatoj kombinaciji, npr. myCombSigns[5]=2 znači: duga se pojavljuje
	// dva puta u zadatoj kombinaciji !!!
	var givenCombSigns:Array;
	var myCombSigns:Array;
	
	var onRightPlace:Number=0;	// onRightPlace: koliko smo pogodili na pravom mestu
	var overAll:Number=0;		// overAll: koliko smo pogodili ukupno
	
	
	function Guess(g:Array,m:Array) {
		if(g==null or m==null) {
			throw new Error("Oba niza se moraju inicijalizovati !!!!");
		}
		else {			
			givenComb=g;//.slice(0,g.length);
			myComb=m;//.slice(0,m.length);
			onRightPlace=0;
			overAll=0;
			
			givenCombSigns=  new Array(0,0,0,0,0,0);
			myCombSigns=  new Array(0,0,0,0,0,0);
		}
	}									
	
	function calculate():Void {
		findOutGivenCombSigns();
		findOutMyCombSigns();
		
		howManyGuessed();
		howManyRightPlaced();
	}	
	
	// moraju da se naprave 2 metoda, jer pozivanje metoda 
	// izgleda da samo radi sa vrednostima ali ne sa referencama !!!
	// function findOut(givenComb,givenCombSigns):Void;
	 function findOutGivenCombSigns():Void {		
		for(var i:Number=0;i<4;i++) {
			if(givenComb[i]==2) givenCombSigns[0]++;
			else
				if(givenComb[i]==3) givenCombSigns[1]++;
				else
					if(givenComb[i]==4) givenCombSigns[2]++;
					else
						if(givenComb[i]==5) givenCombSigns[3]++;
						else
							if(givenComb[i]==6) givenCombSigns[4]++;
							else
								if(givenComb[i]==7) givenCombSigns[5]++;
		}
	}
	
	function findOutMyCombSigns():Void {
  //function findOut(myComb,myCombSigns):Void ;
		for(var i:Number=0;i<4;i++) {
			if(myComb[i]==2) myCombSigns[0]++;
			else
				if(myComb[i]==3) myCombSigns[1]++;
				else
					if(myComb[i]==4) myCombSigns[2]++;
					else
						if(myComb[i]==5) myCombSigns[3]++;
						else
							if(myComb[i]==6) myCombSigns[4]++;
							else
								if(myComb[i]==7) myCombSigns[5]++;
		}
	}
	
	function howManyGuessed():Void { // koliko smo pogodili ukupno
		for(var k:Number=0;k<6;k++) {
			if(myCombSigns[k]>0 and givenCombSigns[k]>0) {
				overAll+=Math.min(myCombSigns[k],givenCombSigns[k]);
			}
		}
	}
	
	public function howManyRightPlaced():Void { 	// koliko smo pogodili
		for(var i:Number=0;i<4;i++) 	{			// na pravom mestu	
			if(myComb[i]==givenComb[i]) 
				onRightPlace++;			
		}
	}
	
	function report():Array { // izveštaj o pogocima
		var reply:Array=new Array();
		
		calculate();
		
		reply.push(overAll);
		reply.push(onRightPlace);
		
		return reply;	// je niz u formatu: "UKUPNO : KOLIKO_TAČNIH"
						// npr. 3:1 znači: ukupno smo pogodili 3 znaka
						// od kojih je 1 na svom mestu
	}
}