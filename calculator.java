package PersonalRepository;
import java.util.Scanner;

class CalculatorTest {
	double result;
	
	String operator;
	double first, sceond;
	
	CalculatorTest(String operator, double first, double sceond) {
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

	public class calculator{
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
	
	CalculatorTest inn = new CalculatorTest(operator, first, sceond);
	System.out.println(first+""+operator+""+sceond+" = " +inn.run());
	
	
	sn.close();
	

	}
}
