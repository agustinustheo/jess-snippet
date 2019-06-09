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



public class Template extends JFrame implements ActionListener{
	
	private static final long serialVersionUID = 1L;
	
	JLabel [] label = new JLabel [10];
	JTextArea [] txt = new JTextArea [10];
	JButton close = new JButton("Close");
	String []kata = new String[10];
	JScrollPane pane = new JScrollPane();
	JPanel pane2 = new JPanel();
	Vector <String> vecnim = new Vector<String>(); 
	Vector <String> vecnama = new Vector<String>(); 
	Vector <Integer> vecumur = new Vector<Integer>(); 
	
	public Template(){
		
		kata[0] = "Nim";
		kata[1] = "Nama";
		kata[2] = "Umur";
		
		
		setTitle("List of clothes");
		setSize(300, 200);
		pane.setLayout(new ScrollPaneLayout());
		pane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		pane2.setLayout(new GridLayout(2, 3));

		for(int i=0;i<3;i++)
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
				QueryResult result = Main.rete.runQueryStar("getmahasiswa", new ValueVector());
				
				while(result.next()){
					vecnim.add(result.getString("nim"));
					vecnama.add(result.getString("nama"));
					vecumur.add(result.getInt("umur"));
				}
				
				for(int i = 0; i < vecnim.size(); i++){
					txt[0].append(vecnim.get(i) + "\n");
					txt[1].append(vecnama.get(i) + "\n");
					txt[2].append(vecumur.get(i) + "\n");
				}
				
			} catch (JessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//
		
		for(int i=0;i<3;i++)
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
