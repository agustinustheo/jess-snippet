import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneLayout;

import jess.JessException;
import jess.QueryResult;
import jess.ValueVector;



public class Template2 extends JFrame implements ActionListener{
	
	private static final long serialVersionUID = 1L;
	
	JLabel [] label = new JLabel [20];
	JTextArea [] txt = new JTextArea [20];
	JButton close = new JButton("Close");
	String []kata = new String[20];
	JScrollPane pane = new JScrollPane();
	JPanel pane2 = new JPanel();
	Vector <String> vectype = new Vector<String>(); 
	Vector <Integer> vecroom = new Vector<Integer>(); 
	Vector <Integer> vecprice = new Vector<Integer>(); 
	Vector <String> veclocation = new Vector<String>(); 
	Vector <Integer> vecgarage = new Vector<Integer>(); 
	
	public Template2(){
		
		kata[0] = "Type";
		kata[1] = "Room";
		kata[2] = "Price";
		kata[3] = "Location";
		kata[4] = "Garage";
		
		
		setTitle("List of House with Garage");
		setSize(500, 400);
		pane.setLayout(new ScrollPaneLayout());
		pane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		pane2.setLayout(new GridLayout(2, 5));

		for(int i=0;i<5;i++)
		{
			txt[i] = new JTextArea();
			txt[i].setLineWrap(true);
			txt[i].setWrapStyleWord(true);
			txt[i].setEditable(false);
			txt[i].setAlignmentX(CENTER_ALIGNMENT);
			label[i] = new JLabel("",JLabel.LEFT);
			label[i].setText(kata[i]);
			pane2.add(label[i]);
		}
		
		//Code in here
			try {
				QueryResult result = Main.rete.runQueryStar("getHouseGarage", new ValueVector());
				
				while(result.next()){
					vectype.add(result.getString("type"));
					vecroom.add(result.getInt("room"));
					vecprice.add(result.getInt("price"));
					veclocation.add(result.getString("location"));
					vecgarage.add(result.getInt("garage"));
				}
				
				for(int i = 0; i < vectype.size(); i++){
					txt[0].append(vectype.get(i) + "\n");
					txt[1].append(vecroom.get(i) + "\n");
					txt[2].append(vecprice.get(i) + "\n");
					txt[3].append(veclocation.get(i) + "\n");
					txt[4].append(vecgarage.get(i) + "\n");
				}
				
			} catch (JessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//
		
		for(int i=0;i<5;i++)
		{
			pane2.add(txt[i]);
		}
		add(pane);
		pane.getViewport().add(pane2);
		add(close,"South");
		close.addActionListener(this);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setVisible(true);
		
	}

	public void actionPerformed(ActionEvent arg0) {
		if(arg0.getSource()==close)
			this.dispose();
	}
	
}