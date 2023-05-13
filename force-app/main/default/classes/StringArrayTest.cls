public class StringArrayTest {
    public static  List<String> generateStringArray(Integer n){
        List<String> stringlist = new List<String>();
        for(integer i=0;i<n;i++){
           stringlist.add('Test '+i);
          
            system.debug(stringlist[i]);
        }
          return stringlist;
        
    } 

}