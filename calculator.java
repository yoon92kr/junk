package PersonalRepository;
import java.util.Scanner;

class RunCalculator {
	double result;
	
	String operator;
	double first, sceond;
	
	RunCalculator(double first, String operator, double sceond) {
		this.operator = operator;
		this.first = first;
		this.sceond = sceond;
	}
	
	double run() {
		
		if (operator.equals("+")==true) {
			result = first+sceond;
			return result; 
		}
		
		else if (operator.equals("-")==true) {
			result = first-sceond;
			return result;
		}
		
		else if (operator.equals("*")==true) {
			result = first*sceond;
			return result;
		}
		
		else if (operator.equals("/")==true) {
			result = first/sceond;
			return result;
			
		}
		
		else System.out.println("worng type!"); {
			result =0;
			return result;
		}
	}
}

	public class Calculator{
	public static void main(String[] args) {
		
	Scanner sn = new Scanner(System.in);
	String operator;
	double first, sceond;
	
	System.out.print("Enter First Number  ");
	first = sn.nextDouble();
	
	System.out.print("Enter Operator (+,-,*,/)  ");
	operator = sn.next();
		
	System.out.print("Enter scoend number  ");
	sceond = sn.nextDouble();
	
	RunCalculator inn = new RunCalculator(first, operator, sceond);
	System.out.println("["+first+"] "+operator+" ["+sceond+"]  =  [" +inn.run()+"]");
	 
	
	sn.close();
	

	}
}
