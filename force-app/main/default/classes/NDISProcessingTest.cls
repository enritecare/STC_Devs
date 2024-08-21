@IsTest
private class NDISProcessingTest {
    @IsTest
    static void testNDISExtractBatch() {

        List<enrtcr__Support_Delivered__c> sdList = testDataFactory.createServiceDeliveredList('Test Site','NDIS','Fee for Service',10);
        insert sdList;
        
        enrtcr__Extract__c extract = testDataFactory.createExtract(System.today().addDays(-30), System.today().addDays(30), 'NDIS');
        insert extract;

        Test.startTest();
            NDISProcessing proc = new NDISProcessing();
            proc.process(extract);
        Test.stopTest();
    }

    @IsTest
    static void testNDISGenerateBatch() {

        List<enrtcr__Support_Delivered__c> sdList = testDataFactory.createServiceDeliveredList('Test Site','NDIS','Fee for Service',10);
        insert sdList;

        enrtcr__Extract__c extract = testDataFactory.createExtract(System.today().addDays(-30), System.today().addDays(30), 'NDIS');
        insert extract;

        List<enrtcr__Extract_Item__c> extractItems = testDataFactory.createExtractItems(sdList,extract.Id);
        insert extractItems;

        Test.startTest();
            NDISProcessing gen = new NDISProcessing();
            gen.generate(extract);
        Test.stopTest();
        
    }
}
