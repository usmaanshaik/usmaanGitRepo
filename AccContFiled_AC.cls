public with sharing class AccContFiled_AC {
	public String ids{get;set;}
	public Contact con {get;set;}
	public AccContFiled_AC(){
		ids=ApexPages.currentPage().getParameters().get('id');
		con = [select id,name,lastname,auto_Check__C,Account.Phone,Account.name,Account.industry from contact where id=:ids];
		// Added by Usman
	}    

}