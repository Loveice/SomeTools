public class Test { 
    int intra1(int level) {
    	Object x = null; 
    	if (level > 0)
    		x = new Object(); 
        if (level < 4) 
        	return x.hashCode(); 
        return 0; 
    }


    int intra2(boolean b) {
    	Object x = null; 
    	if (b) 
    		x = new Object(); 
    	if (!b) 
    		return x.hashCode(); 
    	return 0; 
    }

    int intra3(Object x) {
    	Object y = null; 
    	if (x != null) 
    		y = new Object(); 
        if (y != null) 
        	return x.hashCode() + y.hashCode(); 
        else 
        	return x.hashCode();
    }

    int intra4(boolean b) {
    	Object x = null; 
    	Object y = null; 
    	if (b) 
    		x = "x"; 
    	if (x != null) 
    		y = "y"; 
    	if (y != null) 
    		return x.hashCode + y.hashCode(); 
    	else 
    		return x.hashCode()  
    }

    int intra5(Object x) {
    	if (x == null) {
    		return x.hashCode(); 
    	}
    	return 0; 
    }

    int intra6(Object x) {
    	if (x == null) {
    		Ojbect y = x; 
    		return x.hashCode(); 
    	}
    	return 0; 
    }

    private helper1(Object x, boolean b) {
    	if (b) return 0; 
    	return x.hashCode(); 
    }

    private helper2(Object x) {
    	return x.hashCode(); 
    }

    int inter1(boolean b) {
    	Object x = null; 
    	if (b) 
    		x = new Object(); 
    	return helper1(x, b); 
    }

    int inter2() {
    	return helper2(null); 
    }

    int inter3(boolean b) {
    	Object x = null; 
    	if (b) x = "x"; 
    	return helper2(x); 

    }

    public static void main(String args[]) {
    	System.out.println("Hello world!"); 
    }



}
