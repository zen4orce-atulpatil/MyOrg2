public class MessageMaker 
{
	public void show()
    {
       Boolean isIt = true;
       String x ='you are '+ (isIt ? 'great':'small');
       System.debug(x);
    }
}