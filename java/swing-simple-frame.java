
import java.awt.*;
import javax.swing.*;

public class SampleApp extends JFrame {
    private static final long serialVersionUID = 1L;
    private JLabel label;
    
    public SampleApp(){
        this.setSize(new Dimension(300,200));
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        label = new JLabel("Hello");
        label.setFont(new Font("Serif",Font.PLAIN,28));
        this.add(label,BorderLayout.CENTER);
    }

    public static void main(String[] args) {
        new SampleApp().setVisible(true);
    }
}