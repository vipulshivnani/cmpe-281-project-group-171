
public aspect QTR25 {
	before(): call(void Main.test()){
		System.out.print("*Machine QTR25 ");
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
		}
	
	after(): call(void Base.insertQuarter()){
		if ( !Base.requiredAmountInSlot ) {
            Base.requiredAmountInSlot = true ;
        	System.out.println("Quarter Inserted");
        }
        else {
            System.out.println( "There's already a quarter in the slot" ) ;
        } 
	}
	
	after(): call(void Base.turnCrank()){
		if ( Base.requiredAmountInSlot ) {
            Base.requiredAmountInSlot = false ;
            if ( Base.cnt > 0 ) {
                System.out.println( "Here is your Gumball!  Enjoy!" ) ;
                Base.cnt-- ;
            }
            else {
                System.out.println( "Sorry!  We're out of Gumballs!" ) ;
            }
        }
        else {
            System.out.println( "Crank will not turn without a Quarter!" ) ;
        }      
	}
}