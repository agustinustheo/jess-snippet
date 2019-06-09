import jess.JessException;
import jess.Rete;


public class Main {

	public static Rete rete = new Rete();

	public static void main(String[] args) {
		
		try {
			rete.batch("main.clp");
			rete.reset();
			rete.run();
		} catch (JessException e) {
			e.printStackTrace();
		}
		
	}

}
