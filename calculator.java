package PersonalRepository;
import java.util.InputMismatchException;
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
		
		else System.out.println("");
			 System.out.println("worng type!");
			 result =0;
			 return result;
		
	}
}

	public class Calculator{
	public static void main(String[] args) {
		
	Scanner sn = new Scanner(System.in);
	String operator = null;
	double first = 0, sceond = 0;
	
	System.out.print("Enter First Number  ");

	try {
	first = sn.nextDouble();
	}
	catch(InputMismatchException e) {
		System.out.println("Please enter only number. program exit...");
	
	}
	 
		
	System.out.print("Enter Operator (+,-,*,/)  ");
	try {
	operator = sn.next();
	}
	catch(Exception e) {
		System.out.println("Please enter only operator. program exit...");
	}
	System.out.print("Enter scoend number  ");
	sceond = sn.nextDouble();
	
	RunCalculator inn = new RunCalculator(first, operator, sceond);
	if(inn.run() != 0) 
	System.out.println("["+first+"] "+operator+" ["+sceond+"]  =  [" +inn.run()+"]");
	 
	
	sn.close();
	

	
	}
}
