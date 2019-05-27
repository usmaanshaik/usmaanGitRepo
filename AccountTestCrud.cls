public class AccountTestCrud {
    public string passedid{get;set;}
    public boolean hidePanel{get;set;}
    public boolean showPanel{get;set;}
    public list<Account>  accList{get;set;}
    public list<Account> dsplyRec{get;set;}
    public Account acc{get;set;}
  	public AccountTestCrud(){  
        Id id = ApexPages.currentPage().getParameters().get('id');            
        acc = (Id == null) ? new Account() :[select id,name,AccountNumber,Site,Phone from Account where id=:id];  
        if(Id != null){
            hidePanel = false;
            showPanel = true;                
        }
        else{             
            showPanel = false;      
            hidePanel = true;      
            displayRec();
        }  
	}
	public pagereference save(){      
          accList =  new list<Account>();       
          pagereference p;     
          if(acc.Name != null && acc.Name != ''){
            System.debug('if con');
            accList.add(acc);
            upsert accList;     
            p = new pagereference('/apex/AccountVfpLght');
            p.setRedirect(true); 
            return p;       
   		}
    	else{
            System.debug('else con');
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please fill the required fileds'));
    	}
        return null;
  	}
	public pagereference cancel(){
         pagereference  p = new pagereference('/apex/AccountVfpLght');
         p.setRedirect(true); 
         return p;
     }
     public void displayRec(){
     	dsplyRec = new list<Account>([select id,name,AccountNumber,Site,Phone from Account where CreatedDate= today LIMIT 10]);
   	 }
     public void newRec(){
     	hidePanel = false;        
        showPanel = true;  
    }
     public pagereference editRec(){        
		 pagereference p = new pagereference('/apex/AccountVfpLght?id='+passedid);
         p.setRedirect(true);
         return p;
     }
    public pagereference delRec(){        
		List<Account> acclst = new List<Account>([select id,Name,AccountNumber,Site,Phone  from Account where id =: String.escapeSingleQuotes(passedid)]);
        if(acclst.size()>0){
         delete acclst;
         pagereference p = new pagereference('/apex/AccountVfpLght'); 
         p.setRedirect(true);
         return p;
        }
        return null;
    }
}