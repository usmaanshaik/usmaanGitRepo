global class ContactBatch implements Database.Batchable<Sobject> {
	list<Contact> contacts = new list<Contact>();
	list<String> accId = new list<String>();
	list<String> conId = new list<String>();
	list<String> recId = new list<String>();
	list<String> ids = new list<String>();
	string query;
	public ContactBatch(list<String> con){
		this.ids = con;
		 
	}
	global Database.QueryLocator start(Database.BatchableContext bc){
				query ='select id,accountId,name,RecordTypeId,auto_check__C from contact where id IN:ids';
		
		//String query='select id,name,auto_check__C,RecordTypeId from contact where accountid IN:accId AND id NOT IN :conId AND RecordTypeId IN:recId';   
		return Database.getQueryLocator(query); 
	}	
    global void execute(Database.BatchableContext bc,list<Contact> scope){
    	this.contacts= scope;
    	boolean bb=false;
    	//list<Account> acont = new list<Account>();
    	System.debug('current contact records'+scope);
    	for(contact econt : scope){
			conId.add(econt.id);
			accId.add(econt.accountId);
			recId.add(econt.RecordTypeId); 
			if(econt.auto_check__c ==false){
				bb=true;
				econt.auto_check__c = true;
			} 
			
		}  
    list<contact> conofdb =[select id,name,auto_check__C,RecordTypeId from contact where accountid IN:accId AND id NOT IN :conId AND RecordTypeId IN:recId AND auto_check__C=true];
    	 System.debug('Size of ====>>>>'+conofdb.size());
    	  if(conofdb.size()>0){
    	  	for(contact cont1 : conofdb){
				System.debug('cont ====>>>'+ cont1);   
					cont1.auto_check__c = false; 
					     
    	  }
		update conofdb;
		}
		if(bb){
			update scope;	
		}
			
    } 
    global void finish(Database.BatchableContext bc){
    	System.debug('ids========>>>'+ids);
    	System.debug('records========>>>'+contacts);
    	/*String[] email= new String[]{'usmaanali.shaik@gmail.com'};
    	
    	Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
    	semail.setToAddresses(email);
    	semail.setSubject('Batch apex Program');
    	semail.setPlainTextBody('This mail is genarated via batch apex after contact is created trigger');
    	Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});*/
    }
}