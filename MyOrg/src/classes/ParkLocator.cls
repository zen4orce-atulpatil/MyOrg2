public class ParkLocator {
    //public string[] gt{get;set;}
    
   public  static string[] country(String theCountry) {
       
       ParkService.ParksImplPort park = new ParkService.ParksImplPort();
    // parkService.ParksImplPort park = new parkService.ParksImplPort();
   system.debug(theCountry);
         return park.byCountry(theCountry);
        
    }
 public void did()
 {
    string theCountry='India';
   //  gt=theCountry;
     parkService.ParksImplPort park = new parkService.ParksImplPort();
     park.byCountry(theCountry);
 ParkService.byCountryResponse response_x= new ParkService.byCountryResponse(); 

   
       
 }
}