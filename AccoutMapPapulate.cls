public class AccoutMapPapulate {
	map<id,Account> mapacc = new map<id,Account>();
    list<Account> a = new list<Account>();
    public void mapMethod(){
        Account acc1 = new Account(name='Account1',industry='Banking1');
        Account acc2 = new Account(name='Account2',industry='Banking2');
        Account acc3 = new Account(name='Account3',industry='Banking3');
        mapacc.put(acc1.id, acc1);
        System.debug('=====>>' + acc1.id);
        mapacc.put(acc2.id, acc2);
        mapacc.put(acc3.id, acc3);
        
    }
    
}