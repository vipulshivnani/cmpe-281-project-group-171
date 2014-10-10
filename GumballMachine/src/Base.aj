

public aspect Base {
	static int cnt = 2;
    static boolean requiredAmountInSlot = false ;
	//static int transactionNumber=1;
	public static void insertQuarter(){
		System.out.println("\nYou tried to insert a Quarter!!");		
	}
	public static void insertDime(){
		System.out.println("\nYou tried to insert a Dime!!");		
	}
	public static void insertPenny(){
		System.out.println("\nYou tried to insert a Penny!!");		
	}
	public static void turnCrank(){
		System.out.println("\nYou tried to turn the Crank!!");		      
	}
}