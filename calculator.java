package PersonalRepository;
import java.util.Scanner;

public class calculator {
	
	static double calculator (String a, double b, double c) {
		
		
		double sum;
		double minus;
		double multiply;
		double division;
		double worng = 0;
		
		if (a.equals("+")==true) {
			
			sum = b+c;
			
		return sum; 
		}
		
		else if ( a.equals("-")==true) {
			minus = b-c;
			return minus;
		}
		
		else if ( a.equals("*")==true) {
			multiply = b*c;
			return multiply;
		}
		
		else if (a.equals("/")==true) {
			division = b/c;
			return division;
			
		}
		
		else System.out.println("worng type!");
			return worng;
	}
	
	public static void main(String[] args) {
	Scanner sn = new Scanner(System.in);
	String operator;
	double first, scoend;
	double result;
	System.out.println("Enter Operator (+,-,*,/)");
	operator = sn.next();
	
	System.out.println("Enter first number");
	first = sn.nextDouble();
	
	System.out.println("Enter scoend number");
	scoend = sn.nextDouble();
	
	result = calculator(operator, first, scoend);
	System.out.println(first+""+operator+""+scoend+" = " +result);
	
	
	sn.close();
	

	}
}
