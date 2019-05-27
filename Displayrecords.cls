public with sharing class Displayrecords {
    public list<Emp1__c> listEmp{get;set;}
    public list<Emp1__c> emp;
    public Emp1__c em{get;set;}
    public list<Emp1__c>  list4{get;set;}
    public list<Emp1__c>  nullList{get;set;}
    public String s {get;set;}
    public String name{get;set;}
    public DisplayRecords(){
        Id id = ApexPages.currentPage().getParameters().get('id');
        System.debug('====>id' + id);
        em = (id == null) ? new Emp1__c() :[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C where id=:id];        
        list4 = new list<Emp1__c>();        
        ss();
    }
    public void deleteNull(){        
    	nulllist=[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C];        
        list<Emp1__C> deleteList = new list<Emp1__C>();
        for(Emp1__C ee: nullList){
            //System.debug('--------->111'+ee.emp_name__c);
            if(ee.emp_name__c ==null){
                System.debug('---------->'+ee.emp_name__c);
                deleteList.add(ee);       
            }
            
        }  //System.debug('=====>'+deleteList);
        if(deleteList.size()>0){
            delete deleteList;
        }        
        ss();
    }  
    public void ss(){
        listEmp=[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C where createddate= today limit 20 ];  
    }    
    public void save(){       
        upsert em;
        ss();        
    }    
    public void Del(){
        System.debug('----------> '+s);
        listEmp=[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C where id=:s];        
        delete listEmp;
        ss();        
    }    
    public pageReference Edit(){   
        //listEmp=[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C where id=:s];      
        pageReference p = new pageReference('/apex/displayrecords?id='+s);
        p.setRedirect(true);
        return p;     
    }
    public void search(){         
        listEmp=[select id,name,email__c,emp_name__c,gendar__C,phone__c from Emp1__C ];
          for(Emp1__C list2:listEmp){
         	 if(list2.emp_name__c == name){
              	list4.add(list2);  
        // pageReference p = new pageReference('/apex/displayrecords?');                  
             }              
          }     
        
       	listEmp.clear();
    }       
    public pageReference newS(){
        pageReference p = new pageReference('/apex/displayrecords');       
        p.setRedirect(true);      
        return p;       
    }
}