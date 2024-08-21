@isTest(SeeAllData = false)
public with sharing class testDataFactory {

    public static Date todaysDate = system.today();
    
    //create account
    public static Account createAccount(String recordType){
        //create account
        return new Account(
            Name = 'Test Customer',
            RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(recordType).getRecordTypeId()
        );
    }

    public static Account createAccount(String name, String recordType){
        //create account
        return new Account(
            Name = name,
            RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(recordType).getRecordTypeId()
        );
    }    

    //create contact
    public static Contact createContact(String recordType){
        return new Contact(
            FirstName = 'First',
            LastName = 'test',
            enrtcr__Sex__c = 'Male',
            Birthdate = Date.parse('01/01/1970'),
            OtherStreet = '123 test Street',
            OtherCity = 'Adelaide',
            OtherState = 'SA',
            OtherPostalCode = '5112',
            enrtcr__Date_Client_Registered__c = System.today(),
            enrtcr__Status__c = 'Current',
            RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get(recordType).getRecordTypeId(),
            enrtcr__NDIS_ID__c = '431234567'
        );
    }

    public static Contact createContact(String firstName, String lastName, String recordType){
        return new Contact(
            FirstName = firstName,
            LastName = lastName,
            enrtcr__Sex__c = 'Male',
            Birthdate = Date.parse('01/01/1970'),
            OtherStreet = '123 test Street',
            OtherCity = 'Adelaide',
            OtherState = 'SA',
            OtherPostalCode = '5112',
            enrtcr__Date_Client_Registered__c = System.today(),
            enrtcr__Status__c = 'Current',
            RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get(recordType).getRecordTypeId()
            
        );
    }

    //create Client contact
    public static enrtcr__Client_Contact__c createClientContact(String contactId, String relatedConId){
        return new enrtcr__Client_Contact__c (
               enrtcr__Contact__c = contactId,
               enrtcr__RelatedContact__c = relatedConId, 
               enrtcr__Status__c = 'Current');
    }

    
    //create Support Plan
    public static enrtcr__Personal_Support_Plan__c createPersonalSupportPlan(String contactId){
        return new enrtcr__Personal_Support_Plan__c (
                enrtcr__Client__c = contactId,
                enrtcr__Status__c = 'Current');
    }   

    //create Goal Achivement Plan
    public static enrtcr__Plan__c createGoalPlan(String contactId){
        return new enrtcr__Plan__c (
                enrtcr__Client__c = contactId);
    }  

    //create Goal Achivement Plan Action
    public static enrtcr__Goal_and_Social_Outcome__c createGoalPlanAction(String goalId){
        return new enrtcr__Goal_and_Social_Outcome__c (
            enrtcr__Plan__c = goalId);
    }  

 
    
    //create Associate Provider
    public static enrtcr__Associated_Provider__c createAssociateProvider(String contactId, String status){
        return new enrtcr__Associated_Provider__c (
            enrtcr__Client__c = contactId,
            enrtcr__Status__c = status);
    }     
    
    //create Personal Identifiers
    public static enrtcr__Personal_Identifier__c createPersonalIdentifiers(String contactId, string recordType){
        return new enrtcr__Personal_Identifier__c (
                enrtcr__Client__c = contactId,
                enrtcr__Number__c = '12345678',
                enrtcr__Seq_No__c = '1',
                RecordTypeId = Schema.SObjectType.enrtcr__Personal_Identifier__c.getRecordTypeInfosByName().get(recordType).getRecordTypeId());
    } 

    //create site
    public static enrtcr__Site__c createSite(String siteName, String recordType){
        return new enrtcr__Site__c(
            Name = siteName,
            enrtcr__Site_GL_Code__c = String.valueOf(Integer.valueof((Math.random() * 100))),
            RecordTypeId = Schema.SObjectType.enrtcr__Site__c.getRecordTypeInfosByName().get(recordType).getRecordTypeId()
        );
    }

    //create service
    public static enrtcr__Service__c createService(String recordType){
        return new enrtcr__Service__c(
            Name = 'Test',
            enrtcr__NMDS_Service_Code__c = '1234',
            enrtcr__Status__c = 'Active',
            enrtcr__Include_in_Services_Received_Extract__c = true,
            enrtcr__Include_in_Service_User_Extract__c = true,
            enrtcr__Support_Item_Code__c = '123',
            enrtcr__Travel_Claimable__c = true,
            enrtcr__Cancellation_Claimable__c = true,
            enrtcr__Service_GL_Code__c = String.valueOf(Integer.valueof((Math.random() * 100))),
            RecordTypeId = Schema.SObjectType.enrtcr__Service__c.getRecordTypeInfosByDeveloperName().get(recordType).getRecordTypeId()
        );
    }

    //create reference data program
    public static enrtcr__Reference_Data__c createRefDataprogram(String name){
        return new enrtcr__Reference_Data__c(
            Name = name,
            RecordTypeId = Schema.SObjectType.enrtcr__Reference_Data__c.getRecordTypeInfosByDeveloperName().get('Program').getRecordTypeId()
        );
    }

    //create refdata billing site
    public static enrtcr__Reference_Data__c createRefDataBillingSite(String name){
        return new enrtcr__Reference_Data__c(
            Name = name,
            RecordTypeId = Schema.SObjectType.enrtcr__Reference_Data__c.getRecordTypeInfosByDeveloperName().get('Billing_Site').getRecordTypeId()
        );
    }

    //create site service
    public static enrtcr__Site_Service__c createSiteService(String serviceId, String RefprogramId, String siteId){
        return new enrtcr__Site_Service__c(
            RecordTypeId = Schema.SObjectType.enrtcr__Site_Service__c.getRecordTypeInfosByDeveloperName().get('Service_Assignment').getRecordTypeId(),
            enrtcr__Service__c = serviceId,
            enrtcr__Site__c = siteId,
            enrtcr__Program__c = RefprogramId
        );
    }

    //create reference data rate type
    public static enrtcr__Reference_Data__c createRefDataRateType(String name){
        return new enrtcr__Reference_Data__c(
            Name = name,
            enrtcr__Funding_Type__c = 'NDIS',
            RecordTypeId = Schema.SObjectType.enrtcr__Reference_Data__c.getRecordTypeInfosByDeveloperName().get('Rate_Type').getRecordTypeId()
        );
    }

    //create reference data rate type with incl in extracts
    public static enrtcr__Reference_Data__c createRefDataRateType(String name,String extractToInclude){
        return new enrtcr__Reference_Data__c(
            Name = name,
            enrtcr__Funding_Type__c = 'NDIS',
            enrtcr__Include_in_Extracts__c = extractToInclude,
            RecordTypeId = Schema.SObjectType.enrtcr__Reference_Data__c.getRecordTypeInfosByDeveloperName().get('Rate_Type').getRecordTypeId()
        );
    }

    //create rate
    public static enrtcr__Rate__c createRate(String name,String rateTypeId,String serviceId){
        return new enrtcr__Rate__c(
            Name = name,
            enrtcr__Amount_ex_GST__c = 10,
            enrtcr__Quantity_Type__c = 'Hour',
            enrtcr__GST__c = 0.10,
            enrtcr__Effective_Date__c = todaysDate.addMonths(-1),
            enrtcr__RateType__c = rateTypeId,
            enrtcr__Service__c = serviceId
        );
    }

    //create reference data support category
    public static enrtcr__Reference_Data__c createRefDataSupportCategory(){
        return new enrtcr__Reference_Data__c(
            Name = 'Test Support Category',
            RecordTypeId = Schema.SObjectType.enrtcr__Reference_Data__c.getRecordTypeInfosByDeveloperName().get('Support_Category').getRecordTypeId()
        );
    }

    //create service agreement
    public static enrtcr__Support_Contract__c createServiceAgreement(string clientid){
        return new enrtcr__Support_Contract__c(
            enrtcr__Start_Date__c = todaysDate.addDays(-7),
            enrtcr__End_Date__c = todaysDate.addYears(1),
            enrtcr__Status__c = 'Current',
            enrtcr__Rate_Type__c = 'NDIS',
            enrtcr__Funding_Type__c = 'NDIS',
            enrtcr__Funding_Management__c = 'Package',
            enrtcr__Travel_Labour_Cost_Claims__c = 'Allow',
            enrtcr__Client_Approved_Date__c = todaysDate,
            RecordTypeId = Schema.SObjectType.enrtcr__Support_Contract__c.getRecordTypeInfosByName().get('NDIS').getRecordTypeId(),
            enrtcr__Client__c = clientid
        );
    }

    //create sai category
    public static enrtcr__Support_Contract_Item__c createSaiCategory(String saId){
        return new enrtcr__Support_Contract_Item__c(
                enrtcr__Support_Contract__c = saId,
                RecordTypeId = Schema.SObjectType.enrtcr__Support_Contract_Item__c.getRecordTypeInfosByDeveloperName().get('Category').getRecordTypeId(),
                enrtcr__Funding_Management__c = 'Package'
        );
    }

    //create sai item
    public static enrtcr__Support_Contract_Item__c createSaiItem(string supportCategoryId,
                                                    string saId,
                                                    string siteId,
                                                    string serviceId,
                                                    string siteServiceProgramId,
                                                    string rateId,
                                                    string saiCategoryId){
        return new enrtcr__Support_Contract_Item__c(
            enrtcr__Quantity__c = 1,
            enrtcr__Exclude_Item_In_Totals__c = false,
            RecordTypeId = Schema.SObjectType.enrtcr__Support_Contract_Item__c.getRecordTypeInfosByDeveloperName().get('Item').getRecordTypeId(),
            enrtcr__Support_Category__c = supportCategoryId,
            enrtcr__Support_Contract__c = saId,
            enrtcr__Site__c = siteId,
            enrtcr__Service__c = serviceId,
            enrtcr__Site_Service_Program__c = siteServiceProgramId,
            enrtcr__Rate__c = rateId,
            enrtcr__Funding_Management__c = 'Package',
            enrtcr__Category_Item__c = saiCategoryId
        );
    }

    //create service delivered
    public static enrtcr__Support_Delivered__c createServiceDelivered( string saId,
                                                                string saiId,
                                                                string clientId,
                                                                string siteServiceId,
                                                                String siteId,
                                                                String rateId){
        return new enrtcr__Support_Delivered__c(
            enrtcr__Date__c = todaysDate,
            enrtcr__Quantity__c = 1,
            enrtcr__Current_NDIS_Extract_Item__c = null,
            enrtcr__Client_Rep_Accepted__c =  true,
            enrtcr__Claim_Type__c = 'NF2F',
            enrtcr__Client__c = clientId,
            enrtcr__Support_Contract__c = saId,
            enrtcr__Support_Contract_Item__c = saiId,
            enrtcr__Site_Service_Program__c = siteServiceId,
            enrtcr__Site__c = siteId,
            enrtcr__Rate__c = rateId
        );
    }

    //create service delivered List
    public static List<enrtcr__Support_Delivered__c> createServiceDeliveredList( string saId,
                                                                string saiId,
                                                                string clientId,
                                                                string siteServiceId,
                                                                String siteId,
                                                                String rateId,
                                                                Integer sdNumber){
        List<enrtcr__Support_Delivered__c> sdList = new List<enrtcr__Support_Delivered__c>();
        for(integer i=0;i<sdNumber;i++){
            enrtcr__Support_Delivered__c sd = new enrtcr__Support_Delivered__c(
                enrtcr__Date__c = todaysDate,
                enrtcr__Quantity__c = 1,
                enrtcr__Current_NDIS_Extract_Item__c = null,
                enrtcr__Client_Rep_Accepted__c =  true,
                enrtcr__Claim_Type__c = 'NF2F',
                enrtcr__Client__c = clientId,
                enrtcr__Support_Contract__c = saId,
                enrtcr__Support_Contract_Item__c = saiId,
                enrtcr__Site_Service_Program__c = siteServiceId,
                enrtcr__Site__c = siteId,
                enrtcr__Rate__c = rateId
            ); 
            sdList.add(sd);
        }
        return sdList;
    }

    //Create Extract
    public static enrtcr__Extract__c createExtract(Date startDate, Date endDate, String recordTypeName) {

        enrtcr__Extract__c extract = new enrtcr__Extract__c (
            enrtcr__Start_Date__c = startDate,
            enrtcr__End_Date__c = endDate,
            RecordTypeId = Schema.SObjectType.enrtcr__Extract__c.getRecordTypeInfosByDeveloperName().get(recordTypeName).getRecordTypeId()
        );

        return extract;
    }

    //Create Extract Items
    public static List<enrtcr__Extract_Item__c> createExtractItems(List<enrtcr__Support_Delivered__c> serviceDeliveredList, Id extractId) {

        List<enrtcr__Extract_Item__c> extractItems = new List<enrtcr__Extract_Item__c>();
        for(enrtcr__Support_Delivered__c oSD : serviceDeliveredList) {
            enrtcr__Extract_Item__c extItem = new enrtcr__Extract_Item__c(
                enrtcr__Date__c = oSD.enrtcr__Date__c,
                enrtcr__Service_Name__c = oSD.enrtcr__Service_Name__c,
                enrtcr__Total_ex_GST__c = oSD.enrtcr__Total_ex_GST__c,
                enrtcr__Quantity__c = oSD.enrtcr__Quantity__c,
                enrtcr__Unit_Price__c = String.valueOf(oSD.enrtcr__Rate_ex_GST__c),
                enrtcr__GST_Code__c = 'GST Free',
                enrtcr__Service_Delivered__c = oSD.Id,
                enrtcr__Client__c = oSD.enrtcr__Client__c,               
                enrtcr__Extract__c = extractId
            );
            extractItems.add(extItem);
        }
        return extractItems;
    }

    //create service delivered for rate type
    public static enrtcr__Support_Delivered__c createServiceDelivered(String siteName,String extractToInclude,string rateTypeName){
        //create account
        Account acc = createAccount('Household');
        insert acc;

        Contact client = createContact('Intake');
        client.accountid = acc.id;    
        insert client;
        String clientId = client.Id;

        //create site
        enrtcr__Site__c site = createSite(siteName,'Other');
        insert site;

        //create service
        enrtcr__Service__c service = createService('NDIS');
        insert service;

        //create ref data program
        enrtcr__Reference_Data__c refDataProg = createRefDataprogram('Test');
        insert refDataProg;

        //create siteService
        enrtcr__Site_Service__c siteService = createSiteService(service.Id,refDataProg.Id,site.id);
        insert siteService;

        //create reference data rate type with incl in extracts
        enrtcr__Reference_Data__c refDataRateType = createRefDataRateType(rateTypeName,extractToInclude);
        insert refDataRateType;

        //create rate
        enrtcr__Rate__c rate = createRate('testRate',refDataRateType.Id,service.Id);
        insert rate;

        //create ref datat support category
        enrtcr__Reference_Data__c refDataSuppCategory = createRefDataSupportCategory();
        insert refDataSuppCategory;

        //create service agreement
        enrtcr__Support_Contract__c sa = createServiceAgreement(clientId);
        insert sa;

        //create support category item
        enrtcr__Support_Contract_Item__c sac = createSaiCategory(sa.Id);
        insert sac;

        //create sai item
        enrtcr__Support_Contract_Item__c sai = createSaiItem(refDataSuppCategory.Id,sa.Id,site.Id,service.Id,siteService.Id,rate.Id,sac.Id);
        insert sai;

        //create service delivered
        enrtcr__Support_Delivered__c sd = createServiceDelivered(sa.Id,sai.Id,clientId,siteService.Id,site.Id,rate.Id);
        return sd;
    }

    //create service delivered for rate type List
    public static List<enrtcr__Support_Delivered__c> createServiceDeliveredList(String siteName,String extractToInclude,string rateTypeName,Integer sdNumber){
        //create account
        Account acc = createAccount('Customer/Representative');
        insert acc;

        //create client
        Contact client = createContact('Client');
        client.accountid = acc.id;    
        insert client;

        String clientId = client.Id;

        //create site
        enrtcr__Site__c site = createSite(siteName,'Other');
        insert site;

        //create service
        enrtcr__Service__c service = createService('NDIS');
        enrtcr.BaseAPI.deactivateTrigger('Service__c');
        insert service;
        enrtcr.BaseAPI.activateTrigger('Service__c');

        //create ref data program
        enrtcr__Reference_Data__c refDataProg = createRefDataprogram('Test');
        insert refDataProg;

        //create siteService
        enrtcr__Site_Service__c siteService = createSiteService(service.Id,refDataProg.Id,site.id);
        insert siteService;

        //create reference data rate type with incl in extracts
        enrtcr__Reference_Data__c refDataRateType = createRefDataRateType(rateTypeName,extractToInclude);
        insert refDataRateType;

        //create rate
        enrtcr__Rate__c rate = createRate('testRate',refDataRateType.Id,service.Id);
        enrtcr.BaseAPI.deactivateTrigger('Rate__c');
        insert rate;
        enrtcr.BaseAPI.activateTrigger('Rate__c');

        //create ref datat support category
        enrtcr__Reference_Data__c refDataSuppCategory = createRefDataSupportCategory();
        insert refDataSuppCategory;

        //create service agreement
        enrtcr__Support_Contract__c sa = createServiceAgreement(clientId);
        insert sa;

        //create support category item
        enrtcr__Support_Contract_Item__c sac = createSaiCategory(sa.Id);
        insert sac;

        //create sai item
        enrtcr__Support_Contract_Item__c sai = createSaiItem(refDataSuppCategory.Id,sa.Id,site.Id,service.Id,siteService.Id,rate.Id,sac.Id);
        insert sai;

        //create service delivered
        List<enrtcr__Support_Delivered__c> sdList = createServiceDeliveredList(sa.Id,sai.Id,clientId,siteService.Id,site.Id,rate.Id,sdNumber);
        return sdList;
    }

}