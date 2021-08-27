package PersonalRepository;
import java.util.Scanner;

class Calculator {
	double sum;
	double minus;
	double multiply;
	double division;
	double worng = 0;
	
	String operator;
	double first;
	double sceond;
	
	Calculator(String operator, double first, double sceond) {
		this.operator = operator;
		this.first = first;
		this.sceond = sceond;
	}
	
	double run() {
		
		if (operator.equals("+")==true) {
			
			sum = first+sceond;
			return sum; 
		}
		
		else if (operator.equals("-")==true) {
			minus = first-sceond;
			return minus;
		}
		
		else if (operator.equals("*")==true) {
			multiply = first*sceond;
			return multiply;
		}
		
		else if (operator.equals("/")==true) {
			division = first/sceond;
			return division;
			
		}
		
		else System.out.println("worng type!");
			return worng;
	}
	
	public static void main(String[] args) {
		
	Scanner sn = new Scanner(System.in);
	String operator;
	double first, sceond;
	
	System.out.println("Enter Operator (+,-,*,/)");
	operator = sn.next();
	
	System.out.println("Enter first number");
	first = sn.nextDouble();
	
	System.out.println("Enter scoend number");
	sceond = sn.nextDouble();
	
	Calculator inn = new Calculator(operator, first, sceond);
	System.out.println(first+""+operator+""+sceond+" = " +inn.run());
	
	
	sn.close();
	

	}
}
