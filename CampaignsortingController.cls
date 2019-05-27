public with sharing class CampaignsortingController {
	public Campaign cmpn{get;set;}
	public list<CampaignMember> listRec {get;set;}
	public String recordid{get;set;}
	public CampaignsortingController (Apexpages.StandardController stController){
		this.cmpn = (Campaign)stController.getRecord();
		listRec = [select id,type,Status,FirstName,LastName,title,CompanyOrAccount from CampaignMember where CampaignId=:cmpn.id];
		System.debug('@@@'+listRec.size());
	}
    public pageReference Deletefile(){
    	delete[select id from CampaignMember where id=:recordid];
    	pageReference p = new pageReference('/'+cmpn.Id);
    	return p;
    }
    public String sortField{get;set;}
    public String sortDir{
    	get{if(sortDir == null){
    		sortDir = 'asc';
    	}
    	return sortDir;
    	}
    	set;
    	}
    public void toggleSort(){
    
    	  sortDir = sortDir.equals('asc') ? 'desc' : 'asc'; 
    	  System.debug('3333'+sortField +'%%'+sortDir );
    	  String q = 'Order By' + sortField + ' ' + sortDir;
    	  String query = 'select id,type,Status,FirstName,LastName,title,CompanyOrAccount from CampaignMember where CampaignId=:'+cmpn.id+''+q;
    	  listRec = Database.query(query);
    	  System.debug('===='+listRec.size());
    }
}