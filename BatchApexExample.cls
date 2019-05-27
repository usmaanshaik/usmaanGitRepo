/*global class BatchApexProgramEx_Ac implements Database.Batchable<Sobject> {
	global Database.QueryLocator start(Database.BatchableContext bc){
		String query='select id,name from Account limit 10';   
		return Database.getQueryLocator(query);   
	}	
    global void execute(Database.BatchableContext bc,list<Account> acc){
    	//list<Account> acont = new list<Account>();
    	for(Account aa : acc){
    		aa.Description ='Description is updated from Batch Apex job using class==========>>';
    		 
    	}
    	update acc;
    }
    global void finish(Database.BatchableContext bc){
    	String[] email= new String[]{'usmaanali.shaik@gmail.com'};
    	
    	Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
    	semail.setToAddresses(email);
    	semail.setSubject('Batch apex Program');
    	semail.setPlainTextBody('This mail is genarated via batch apex when it execute');
    	Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});
    }
}*/

global class BatchApexExample implements Database.Batchable<Sobject> {
	// Updating Account Name from Batch Job
	global Database.QueryLocator start(Database.BatchableContext bc){
		String query='select id,name from Account';   
		return Database.getQueryLocator(query);   
	}	
    global void execute(Database.BatchableContext bc,list<Account> acc){
    	 
    	for(Account aa : acc){
    		aa.Name =aa.Name.remove('Updated from Batch Apex class');    		 
    	}
    	update acc;
    }
    global void finish(Database.BatchableContext bc){
    	 
    }
}