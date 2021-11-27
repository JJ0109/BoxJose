using BoxService as service from 'boxverwaltungV2../../../home/user/projects/boxverwaltungV2/srv/boxservice';


//
// annotatios that control the fiori layout
//

annotate BoxService.Box with @UI : {

  Identification : [
    //{ $Type  : 'UI.DataFieldForAction', Action : 'BoxService.acceptBox',   Label  : '{i18n>AcceptBox}'   },
    //{ $Type  : 'UI.DataFieldForAction', Action : 'BoxService.rejectBox',   Label  : '{i18n>RejectBox}'   }
    //{ $Type  : 'UI.DataFieldForAction', Action : 'BoxService.deductDiscount', Label  : '{i18n>DeductDiscount}' }
  ],
  HeaderInfo : {
    TypeName       : 'Box',
    TypeNamePlural : 'Box',
    Title          : {
      $Type : 'UI.DataField',
      Value : BoxID
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : 'BoxID'
    }
  },
  PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : BoxID,
      Descending : true
    }]
  },
  SelectionFields : [
    BoxID,
    to_Patient_PatientID,
    BoxStatus_code
  ],
  LineItem : [
   // { $Type  : 'UI.DataFieldForAction', Action : 'BoxService.acceptBox',   Label  : '{i18n>AcceptBox}'   },
   // { $Type  : 'UI.DataFieldForAction', Action : 'BoxService.rejectBox',   Label  : '{i18n>RejectBox}'   },
    //{ $Type  : 'UI.DataFieldForAction', Action : 'BoxService.deductDiscount', Label  : '{i18n>DeductDiscount}' },
    { Value : BoxID, Label:'BoxID'               },
    { Value : to_Patient_PatientID, Label:'Patient'  },
    { Value : BeginDateAusleihe, Label:'Ausleihdatum'               },
    { Value : EndDateAusleihe,  Label:'Rueckgabedatum'               },
    { Value : Boxname ,Label:'Boxname'            },
    { $Type : 'UI.DataField', Value : BoxStatus_code, Criticality : BoxStatus.criticality, Label:'Box Status'  }
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : 'Box',
    ID     : 'Box',
    Facets : [
      {  // travel details
        $Type  : 'UI.ReferenceFacet',
        ID     : 'BoxData',
        Target : '@UI.FieldGroup#BoxData',
        Label  : 'Box'
      },
      {  // date information
        $Type  : 'UI.ReferenceFacet',
        ID     : 'DateData',
        Target : '@UI.FieldGroup#DateData',
        Label  : 'Datum'
      }
      ]
  }, {  // booking list
    $Type  : 'UI.ReferenceFacet',
    Target : 'to_Geraete/@UI.PresentationVariant',
    Label  : 'Geraete'
  }],
  FieldGroup#BoxData : { Data : [
    { Value : BoxID, Label:'BoxID'                },
    { Value : to_Patient_PatientID, Label:'Patient'  },
    { Value : Boxname , Label:'Boxname'            },
    {
      $Type       : 'UI.DataField',
      Value       : BoxStatus_code,
      Criticality : BoxStatus.criticality,
      Label : 'Box Status' // label only necessary if differs from title of element
    }
  ]},
  FieldGroup #DateData : {Data : [
    { $Type : 'UI.DataField', Value : BeginDateAusleihe, Label:'Ausleihdatum'  },
    { $Type : 'UI.DataField', Value : EndDateAusleihe, Label:'Rueckgabedatum'  }
  ]}
};

annotate BoxService.Geraete with @UI : {
  Identification : [
    { Value : GeraeteID },
  ],
  HeaderInfo : {
    TypeName       : 'Geraete',
    TypeNamePlural : 'Geraete',
    Title          : { Value : GeraeteID },
    Description    : {
      $Type : 'UI.DataField',
      Value : 'GeraeteID'
    }
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : GeraeteID,
      Descending : false
    }]
  },
  SelectionFields : [],
  LineItem : [
    { Value : to_Geraetetyp.AnleitungURL,  Label : '  '},
    { Value : GeraeteID,             Label : 'GeraeteID' },
    { Value : to_Geraetetyp_GeraetetypID , Label:'Geraetetyp'   },
    { Value : GeraeteStatus_code, Label:'Geraete Status'      }
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : 'Geraete',
    ID     : 'Geraete',
    Facets : [{  // booking details
      $Type  : 'UI.ReferenceFacet',
      ID     : 'GeraeteData',
      Target : '@UI.FieldGroup#GeraeteData',
      Label  : 'Geraete'
    }]
  }, ],
  FieldGroup #GeraeteData : { Data : [
    { Value : GeraeteID , Label:'GeraeteID'              },
    { Value : to_Geraetetyp_GeraetetypID, Label:'Geraetetyp'    },
    { Value : GeraeteStatus_code, Label:'Geraete Status'      }
  ]},
};




