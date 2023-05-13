public class NewCaseListController {
    public List<Case> getNewCases(){
        List<case> caseRecords = [Select Id,CaseNumber from Case where status = 'New'];
        return caseRecords;
    }
}