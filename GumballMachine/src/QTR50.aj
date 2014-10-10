
public aspect QTR50 {
	before(): call(void Main.test()){
		System.out.print("*Machine QTR50 ");
	}
	
	after(): call(void Main.test()){
		Base.turnCrank();
		Base.insertQuarter();
		Base.turnCrank();
		Base.insertQuarter();
		Base.turnCrank();
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
	        System.out.println( "There are already quarters in the slot" ) ;
	    }		
	}
	
	after(): call(void Base.turnCrank()){
		
		if ( C50.coinValue == 50 ) {
			C50.coinValue = 0 ;
	        if ( Base.cnt > 0 ) {
	            System.out.println( "Here is your Gumball!  Enjoy!" ) ;
	            Base.cnt-- ;
	        }
	        else {
	            System.out.println( "Sorry!  We're out of Gumballs!" ) ;
	        }
	    }
	    else {
	        System.out.println( "Crank will not turn without Quarters!" ) ;
	    }    
	}
}
/*

private int cnt = 0;
private int coinValue = 0 ;

public GumballMachine2(int count)
{
    this.cnt = count ;
}

public void insertQuarter()
{
    if ( coinValue < 50 ) {
        coinValue += 25 ;
    }
    else {
        System.out.println( "There are already quarters in the slot" ) ;
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
        System.out.println( "Crank will not turn without Quarters!" ) ;
    }              

}
*/