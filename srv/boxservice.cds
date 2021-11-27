using {slah.db as slah} from '../db/schema';

@path: '/sap/opu/odata/sap/API_BOX'
service BoxService {
    entity Box as projection on slah.Box;
    entity Geraete as projection on slah.Geraete;
    entity Geraetetyp as projection on slah.Geraetetyp;
    entity GVerbindung as projection on slah.GVerbindung;
}
