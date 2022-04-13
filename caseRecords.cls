public with sharing class caseRecords {
    @AuraEnabled (cacheable=true)
    public static List <wrapperCaseClass> getCaseRecords(){
        List <Case> altCase = [SELECT Account.Name, 
                                Contact.Name, FinServ__FinancialAccount__r.Name, 
                                On_Off_Platform__c, Fund_Name__c, Amount__c, Fund_Addition__C
                                FROM Case];
        
        List<wrapperCaseClass> wCaseList = new List<wrapperCaseClass>();
        for(case var:altCase)
        {
           wrapperCaseClass wCaseTempVar = new wrapperCaseClass();
           wCaseTempVar.wAccountName =var.Account.Name;
           wCaseTempVar.wContact =var.Contact.Name;
           wCaseTempVar.wFinServFinancialAccount = var.FinServ__FinancialAccount__r.Name;
           wCaseTempVar.wOn_Off_Platform = var.On_Off_Platform__c;
           wCaseTempVar.wFund_Name = var.Fund_Name__c;
           wCaseTempVar.wAmount = var.Amount__c;
           wCaseTempVar.wFund_Addition = var.Fund_Addition__c;
           wCaseList.add(wCaseTempVar);

        }
        
        
return wCaseList;
    }
    
    
    public class wrapperCaseClass{
        @AuraEnabled public  string  wAccountName{get;set;}
        @AuraEnabled public  string  wContact{get;set;}
        @AuraEnabled public  string  wFinServFinancialAccount{get;set;}
        @AuraEnabled public  string  wOn_Off_Platform{get;set;}
        @AuraEnabled public  string  wFund_Name{get;set;}
        @AuraEnabled public  decimal wAmount{get;set;}
        @AuraEnabled public  boolean wFund_Addition{get;set;}
    }
    
}