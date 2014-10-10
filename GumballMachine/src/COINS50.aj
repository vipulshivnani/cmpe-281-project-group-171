
public aspect COINS50 {
	before(): call(void Main.test()){
		System.out.print("*Machine QTR50 ");
	}
	
	after(): call(void Main.test()){
		Base.insertQuarter();
		Base.insertPenny();
		Base.insertDime();
		Base.insertDime();
		Base.turnCrank();
		Base.insertQuarter();
		Base.insertDime();
		Base.insertQuarter();
		Base.turnCrank();
		Base.insertQuarter();
		Base.insertQuarter();
		Base.insertQuarter();
		Base.turnCrank();
		Base.insertQuarter();
		Base.insertQuarter();
		Base.insertQuarter();
		Base.turnCrank();
		}
	
after(): call(void Base.insertQuarter()){
		
		if ( C50.coinValue < 50 ) {
	        C50.coinValue += 25 ;
        	System.out.println("Quarter Inserted");
	    }
	    else {
	        System.out.println( "There are already coins in the slot" ) ;
	    }		
	}

after(): call(void Base.insertDime()){
	
		if ( C50.coinValue < 50 ) {
	        C50.coinValue += 10 ;
	    	System.out.println("Dime Inserted");
	    }
	    else {
	        System.out.println( "There are already coins in the slot" ) ;
	    }		
	}

after(): call(void Base.insertPenny()){
	
		if ( C50.coinValue < 50 ) {
	        C50.coinValue += 5 ;
	    	System.out.println("Penny Inserted");
	    }
	    else {
	        System.out.println( "There are already coins in the slot" ) ;
	    }		
	}

	after(): call(void Base.turnCrank()){
		
		if ( C50.coinValue >= 50 ) {
	        if ( Base.cnt > 0 ) {
	            System.out.println( "Here is your Gumball!  Enjoy!" ) ;
	            Base.cnt-- ;
	            System.out.println( "Change Returned: " + (C50.coinValue-50)) ;
	        }
	        else {
	            System.out.println( "Sorry!  We're out of Gumballs!" ) ;
	        }
			C50.coinValue = 0 ;
	    }
	    else {
	        System.out.println( "Crank will not turn without enough coins!" ) ;
	    }    
	}
}
/*

private int cnt = 0;
private int coinValue = 0 ;

public GumballMachine3(int count)
{
    this.cnt = count ;
}

public void insertCoin( int value )
{
    if ( coinValue < 50 ) {
        coinValue += value ;
    }
    else {
        System.out.println( "There is already enough coins in the slot" ) ;
    }            
}

public void turnTheCrank()
{
    if ( coinValue == 50 ) {
        coinValue = 0 ;
        if ( cnt > 0 ) {
            System.out.println( "Here is your Gumball!  Enjoy!" ) ;
            cnt-- ;
        }
        else {
            System.out.println( "Sorry!  We're out of Gumballs!" ) ;
        }
    }
    else {
        System.out.println( "Crank will not turn without enoush Coins!" ) ;
    }              

}*/