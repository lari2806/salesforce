public with sharing class CheckCaseStatusBot {

    public class CaseOutput {
        @InvocableVariable(required=true)
        public String caseStatus;
    }

    public class CaseInput {
        @InvocableVariable(required=true)
        public String caseNumber;
    }

    @InvocableMethod(label = 'Check Case Status')
    public static List<CaseOutput> getCaseStatus(List<CaseInput> caseInputs){
        Set<String> caseNumbers = new Set<String>();

        for(CaseInput caseInp : caseInputs){
            caseNumbers.add(caseInp.CaseNumber);
        }

        List<case> cases =
            [SELECT Subject, Id, CaseNumber, Status FROM case WHERE    CaseNumber in :caseNumbers];

        Map<String,String> mapNameStatus = new Map<String,String>();
        if(cases.size() > 0){
            for(case vCase: cases){
                mapNameStatus.put(vCase.CaseNumber, vCase.Status);
            }
        }

        List<CaseOutput> caseOutputs = new List<CaseOutput>();
        for(CaseInput caseInput: caseInputs){
            CaseOutput caseOutput = new CaseOutput();

            if(mapNameStatus.containsKey(caseInput.CaseNumber)){
                caseOutput.CaseStatus = mapNameStatus.get(caseInput.CaseNumber);
            }else{
                caseOutput.CaseStatus = 'Case Not Found';
            }
            caseOutputs.add(caseOutput);
        }
            return caseOutputs;
    }

}