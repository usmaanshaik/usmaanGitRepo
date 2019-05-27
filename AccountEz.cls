public class AccountEz{
    public  Account acc {get;set;} 
    public id id{get;set;}
    public AccountEz(){
         id = apexpages.currentPage().getParameters().get('id');  
        
    
    }
    public PageReference sendEmailNPdf(){
        PageReference pdf = Page.GeneratePdf;
            pdf.getParameters().put('id',id);
            pdf.setRedirect(true);
           Blob body=pdf.getContent();
            Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
            list<Messaging.SingleEmailMessage> msgList= new List<Messaging.SingleEmailMessage>();
            attachment.setFileName('AccountInfo.pdf');
            attachment.setBody(body);        
            Contact tempContact = [select id from Contact where AccountId != null limit 1];
            String[] toAddresses = new String[]{'usmaanali.shaik@gmail.com'};
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            EmailTemplate ET= [select Body, Name, Subject, IsActive from EmailTemplate where name = 'empNameEalert' and IsActive = true];
            email.setToAddresses(toAddresses); 
            email.setTargetObjectId(tempContact.id);
            email.setTemplateId(ET.id);
            email.setWhatId(id);
            msgList.add(email);
            Savepoint sp = Database.setSavepoint();
            Messaging.sendEmail(msgList);
            Database.rollback(sp);
            List<Messaging.SingleEmailMessage> msgListToBeSend = new List<Messaging.SingleEmailMessage>();       
            list<Messaging.EmailFileAttachment> attachments = new list<Messaging.EmailFileAttachment>();
            attachments.add(attachment);
            for (Messaging.SingleEmailMessage emails : msgList) {
            Messaging.SingleEmailMessage emailToSend = new Messaging.SingleEmailMessage();
            emailToSend.setToAddresses(emails.getToAddresses());
            emailToSend.setPlainTextBody(emails.getPlainTextBody());
            emailToSend.setHTMLBody(emails.getHTMLBody());
            emailToSend.setSubject(emails.getSubject());
            emailToSend.setFileAttachments(attachments);
            msgListToBeSend.add(emailToSend);
            }
            Messaging.sendEmail(msgListToBeSend);
        	PageReference p = new PageReference('/'+ id);
        	
			return p;
       }
}