public class StringArrayTest 
{
    public static List<String> generateStringArray(Integer n)
    {
       List<String> al = new List<String>();
        
        for(Integer i=0;i<n;i++)
        {
            al.add('Test '+i);
            System.debug(al[i]);
        }
        
        return al;
    }
}