public class ContactController {
	@AuraEnabled
    public static list<Contact> getContacts(){
        list<Contact> conlist =[select id,name,email,phone,MailingStreet,LeadSource from contact limit 10];        
        return conlist;
        
    }
}