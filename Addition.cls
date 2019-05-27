public class Addition {
    public integer i{get;set;}
    public String msg{get;set;}
    
    public integer j{get;set;}
    public integer total{get;set;}
     public integer substraction{get;set;}
     public integer multiplication{get;set;}
    public integer division{get;set;}
    
    public void add(){
        system.debug('total = '+total);
        total=i+j;
        msg='You pressed for addition , Result is :' + total;
        system.debug('I= '+i);
        system.debug('J= '+j);
       
    }
    public void sub(){
        
        substraction=i-j;
        msg='you pressed for substractoin, Result is:'+ substraction;
    }    
    public void multi(){
        multiplication=i*j;
        msg='you pressed for  Multiplication, Result is:'+ multiplication;
    
    }
    public void divi(){
        division=i/j;
        msg='you pressed for Division, Result is:'+ division;
        
    }
    
}