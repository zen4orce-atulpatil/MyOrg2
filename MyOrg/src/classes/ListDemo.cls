public class ListDemo 
{
public void execute()
{
    

    List<String> colors = new List<String>();
    colors.add('blue');
    colors.add('orange');
    colors.add('red');
    colors.add('blue');
    
    String c1=colors.get(0);
    String c2=colors[3];
    
    System.assertEquals(c1, c2);
    System.debug(c1.equals(c2));
    for(Integer i=0;i<colors.size();i++)
    {
        System.debug(colors[i]);
    }
}
    
}