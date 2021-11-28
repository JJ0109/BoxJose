using {slah.db as slah} from '../db/schema';

@path: '/sap/opu/odata/sap/API_BOX'
service BoxService {
    entity Box as projection on slah.Box actions{
    //action createBoxByTemplate() returns Box;
    action rejectBox();
    action acceptBox();
    //action deductDiscount( percent: Percentage not null ) returns Box;
  };
    annotate  Box with @odata.draft.enabled;
    entity Geraete as projection on slah.Geraete;
    entity Geraetetyp as projection on slah.Geraetetyp;
    entity GVerbindung as projection on slah.GVerbindung;
}