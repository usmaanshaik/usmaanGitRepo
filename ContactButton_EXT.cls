public class ContactButton_EXT {
    //Define the Project Object
    Contact theContact = new Contact();  
    usmandfl__Emp1__c  emp = new usmandfl__Emp1__c();
    String theContactID; 
    String theContactName; 
    String theURL;
    String s= 'Hi';
    // Constructor - this only really matters if the autoRun function doesn't work right     
    public ContactButton_EXT(ApexPages.StandardController stdController) {        
        this.theContact = (Contact)stdController.getRecord();     
    } 
    
    // Code invoked on page load.      
    public PageReference autoRun()
    {           
        String thePageContactId = ApexPages.currentPage().getParameters().get('id'); 
        if (thePageContactId == null) {             
            // Display the Visualforce page's error message if no Id is passed over             
            return null;         
        }       
      
    for (Contact theContact:[select Id, Name from Contact where id =:thePageContactId Limit 1]) { 
        
        theContactID = theContact.Id; 
        emp.usmandfl__Contact__c = theContact.id;
        //insert emp;
        theContactName = theContact.Name; 

        /*TheURL = 'https://somewebsite.com/SFDC/SFDC_Portal.aspx?OPRNBR=' + theOpportunityID  + '&OPRTYP=1&OPRACCT='+ theAccountID; */
       //TheURL = '/0Q0/e?nooverride=1&7894:1;0='+theContactID+'&7894:1;0='+theContactName+'&retURL=%2Fa0w%2Fo&saveURL=%2Fapex%2Fsbqq__editquotelines&sfdc.override=1';
      //TheURL = '/0Q0/e?CF00N2800000DOKRW='+theContactName+'&CF00N2800000DOKRW_lkid='+theContactID+'&retURL=/'+theContactID+'&sfdc.override=1';
       // TheURL='https://ap2.salesforce.com/0Q0/e?retURL=%2F0062800000Aorec&oppid=0062800000Aorec';
       //TheURL='https://ap2.salesforce.com/a03/e?retURL=%2Fa03%2Fo';
      // TheURL = '/'+emp.id+'/e';
       TheURL='/a03/e?CF00NA0000005JzZX='+theContactName+'&CF00NA0000005JzZX_lkid='+theContactID+'&retURL=/'+theContactID;
          }  
      
    // Redirect the user to where ever you want to go.
    PageReference pageRef = new PageReference(TheURL);         
    pageRef.setRedirect(true);      
    return pageRef;    
    }
}