using app.schema as service from '../db/schema';

// Product annotations
annotate service.ZPRODUCT with @(UI: {
    SelectionFields : [PRODUCTID,PRODSERIES],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PRODUCTID
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : PRODDESC
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : PRODFAMILY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODSERIES
        }
    ],
    HeaderInfo          :{
        Title          : {Value : PRODUCTID},
        Description    : {Value : PRODDESC},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    },    
   HeaderFacets                   : [
    {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#AdministrativeData',
        ![@UI.Importance] : #Medium
    }
    ],
        
    FieldGroup #AdministrativeData : {Data : [

        {
            $Type             : 'UI.DataField',
            Value             : MATERIALTYPE,
            //![@UI.Importance] : #Medium
        },
        {
            $Type : 'UI.DataField',
            Value : LOCID
        },
        {
            $Type : 'UI.DataField',
            Value : AUTHGROUP
        },
        {
            $Type : 'UI.DataField',
            Value : UOM
        }
        ]},
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : PRODFAMILY
        },
        {
            $Type : 'UI.DataField',
            Value : PRODGROUP
        },
        {
            $Type : 'UI.DataField',
            Value : PRODSERIES
        },
        {
            $Type : 'UI.DataField',
            Value : PRODMODEL
        },
        {
            $Type : 'UI.DataField',
            Value : PRODMRANGE
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'ProdDetails',
        Label  : 'Product Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Product Details',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);
  
//////////////////////////////////////////////////////////////////////
//******************************************************************//
//////////////////////////////////////////////////////////////////////
annotate service.ZLOCATION with @(UI : {
SelectionFields : [LOCID,LOCTYPE],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            //Label : 'Location ID',
            Value : LOCID
        },
        {
            $Type : 'UI.DataField',
            //Label : 'Description',
            Value : LOCDESC
        },
        {
            $Type : 'UI.DataField',
            //Label : 'Location Type',
            Value : LOCTYPE
        }
    ],
    HeaderInfo      : {
        Title          : {Value : LOCID},
        Description    : {Value : LOCDESC},
        TypeName       : 'Location',
        TypeNamePlural : 'Location',
    },
    HeaderFacets                   : [
    {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium
    }
    ],  
    FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : LOCDESC
    }
    ]},
    FieldGroup #Details       : {Data : [
        {
        $Type : 'UI.DataField',
        Value : LOCDESC
    },
    {
        $Type : 'UI.DataField',
        Value : LOCTYPE
    },
    {
        $Type : 'UI.DataField',
        Value : LATITUDE
    },
    {
        $Type : 'UI.DataField',
        Value : LONGITUTE
    }
    ]}
},

// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'LocDetails',
        Label  : 'Location Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Location Details',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);


// Customer Group annotations
annotate service.ZCUSTOMERGROUP with @(UI : {
    SelectionFields : [CUSTGROUP],
    LineItem        : [
        {
            Label : 'Customer Group',
            Value : CUSTGROUP
        },
        {
            Label : 'Description',
            Value : CUSTDESC
        }
    ],
    HeaderInfo      : {
        Title          : {Value : CUSTGROUP},
        Description    : {Value : CUSTDESC},
        TypeName       : 'Customer Group',
        TypeNamePlural : 'Customer Groups',
    },
    HeaderFacets                   : [
    {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium,
        
    }
    ],  
    FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : CUSTGROUP
    },
    {
        $Type : 'UI.DataField',
        Value : CUSTDESC
    },
    ]},
    FieldGroup #Details        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : CUSTDESC
    }
    ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'custDetails',
        Label  : 'Customer Group Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Customer Group Details',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);
// Product attributes
annotate service.PRDATR with @(UI: {
    SelectionFields : [PRODUCT_ID,PRODUCT_FAMILY],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PRODUCT_ID
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : PRODUCT_GROUP
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : PRODUCT_FAMILY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODUCT_SERIES
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODUCT_MODEL
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODUCT_MRANGE
        }
    ],
    HeaderInfo      : {
        Title          : {Value : LOCATION_ID},
        Description    : {Value : PRODUCT_ID},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    },
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_FAMILY
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GROUP
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_SERIES
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_MODEL
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_MRANGE
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'ProdaTR',
        Label  : 'Product Attributes',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Product Attributes',
            Target : '@UI.FieldGroup#Details'
        }]
    }]
);
// Product Configuration
annotate service.PRODCONFIG with @(UI: {
    SelectionFields : [PRODUCT_ID,CHAR_NAME,CHAR_ATTR],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PRODUCT_ID
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : CLASS
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : CHAR_NAME
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_VALUE
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_VALUE_DESC
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_ATTR
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_DESC
        }
        
    ],
    HeaderInfo      : {
        Title          : {Value : PRODUCT_ID},
        Description    : {Value : LOCATION_ID},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    },    
  /*  HeaderFacets                   : [
   {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium
    },
    {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#AdministrativeData',
        ![@UI.Importance] : #Medium
    }
    ], */ 
    /*FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : PRODDESC
    }
    ]},*/
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : CLASS
        },
        {
            $Type : 'UI.DataField',
            Value :CHAR_NAME
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_VALUE
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_VALUE_DESC
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_ATTR
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_DESC
        },
        {
            $Type : 'UI.DataField',
            Value : CUSTOMER_GROUP
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'ProdCfg',
        Label  : 'Product Configurations',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Product Configurations',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);
// Product Configuration
annotate service.SALESHIS with @(UI: {
    SelectionFields : [SALES_DOC,DOC_DATE,PRODUCT_ID],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : SALES_DOC
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : SALES_DOC_ITEM
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : DOC_DATE
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : SCHEDULE_LINE_NUMBER
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODUCT_ID
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CUSTOMER_GROUP
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : LOCATION_ID
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : ORD_QTY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : NET_VALUE
        }
        
    ],
    HeaderInfo      : {
        Title          : {Value : SALES_DOC},
        Description    : {Value : SALES_DOC_ITEM},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    },    
    HeaderFacets                   : [
   {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium
    }
    ],  
    FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : DOC_DATE
    },
    {
        $Type : 'UI.DataField',
        Value : SCHEDULE_LINE_NUMBER
    },
        {
            $Type : 'UI.DataField',
            Value : CONFIRMED_QTY
        }
    ]},
    FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_ID
        },
        {
            $Type : 'UI.DataField',
            Value : REASON_REJ
        },
        {
            $Type : 'UI.DataField',
            Value : UOM
        },
        {
            $Type : 'UI.DataField',
            Value : MAT_AVAIL_DATE
        },
        {
            $Type : 'UI.DataField',
            Value : CUSTOMER_GROUP
        },
        {
            $Type : 'UI.DataField',
            Value : LOCATION_ID
        },
        {
            $Type : 'UI.DataField',
            Value : ORD_QTY
        },
        {
            $Type : 'UI.DataField',
            Value : NET_VALUE
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'saleshis',
        Label  : 'Sales History',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Sales History',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);
// SALES HISTORY CONF'
annotate service.SALESH_CFG with @(UI: {
    SelectionFields : [SALES_DOCUMENT,PRODUCT_ID,CHARACTERSTIC],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : SALES_DOCUMENT
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : SALES_DOCUMENT_ITEM
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : PRODUCT_ID
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHARACTERSTIC
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHARACTERSTIC_VALUE
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PROD_AVAILABILITY_DT
        }
        
    ],
    HeaderInfo      : {
        Title          : {Value : SALES_DOCUMENT},
        Description    : {Value : SALES_DOCUMENT_ITEM},
        TypeName       : 'Sales Doc',
        TypeNamePlural : 'Sales Documents',
    },
    FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_ID
        },
        {
            $Type : 'UI.DataField',
            Value : CHARACTERSTIC
        },
        {
            $Type : 'UI.DataField',
            Value : CHARACTERSTIC_VALUE
        },
        {
            $Type : 'UI.DataField',
            Value : PROD_AVAILABILITY_DT
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'salescfg',
        Label  : 'Sales History',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Sales History',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);// Product Configuration
annotate service.SALESH_CSY with @(UI: {
    SelectionFields : [WEEK_DATE, CHARACTERSTICS],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : WEEK_DATE
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : CHARACTERSTICS
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : CHARACTERSTICS_VALUE
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CLASS
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODUCT_ID
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CUSTOMER_GROUP
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : LOCATION_ID
        }
        
    ],
    HeaderInfo      : {
        Title          : {Value : WEEK_DATE},
        Description    : {Value : CLASS},
        TypeName       : 'Class',
        TypeNamePlural : 'Classes',
    },
    HeaderFacets                   : [
   {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium
    }
    ],  
    FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : CHARACTERSTICS
    },
    {
        $Type : 'UI.DataField',
        Value : CHARACTERSTICS_VALUE
    }
    ]},
    FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_ID
        },
        {
            $Type : 'UI.DataField',
            Value : CUSTOMER_GROUP
        },
        {
            $Type : 'UI.DataField',
            Value : LOCATION_ID
        },
        {
            $Type : 'UI.DataField',
            Value : SALEHIST_PROD
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'salescfg',
        Label  : 'Sales History',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Sales History',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);

///////////////////////////////////////////////////////////////////
///*************************************************************///
///////////////////////////////////////////////////////////////////
annotate service.PIRCH with @(UI: {
    SelectionFields : [MATERIAL, PLANT],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : MATERIAL
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : PLANT
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : CHARACTERSTIC
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : CHARACTERSTIC_VALUE
        },
        {
           $Type : 'UI.DataField',//Label : 'Product Series',
           Value : CH_QTY
        }
        
    ],
    HeaderInfo      : {
        Title          : {Value : MATERIAL},
        Description    : {Value : PLANT},
        TypeName       : 'PIR Char',
        TypeNamePlural : 'PIR Chars',
    },HeaderFacets                   : [
    {
        $Type             : 'UI.ReferenceFacet',
        Target            : '@UI.FieldGroup#Description',
        ![@UI.Importance] : #Medium
    }
    ],  
    FieldGroup #Description        : {Data : [
    {
        $Type : 'UI.DataField',
        Value : PLANT
    }
    ]},
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : REQ_DATE
        },
        {
            $Type : 'UI.DataField',
            Value : PT_NUMBER
        },
        {
            $Type : 'UI.DataField',
            Value : PT_LINE
        },
        {
            $Type : 'UI.DataField',
            Value : SESSION_ID
        },
        {
            $Type : 'UI.DataField',
            Value : CHARACTERSTIC
        },
        {
            $Type : 'UI.DataField',
            Value : CHARACTERSTIC_VALUE
        },
        {
            $Type : 'UI.DataField',
            Value : FLAG_USAGE
        },
        {
            $Type : 'UI.DataField',
            Value : PROCESS_FLAG
        },
        {
            $Type : 'UI.DataField',
            Value : CH_QTY
        }
        ]},
        
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'PIRDetails',
        Label  : 'PIR Config Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'PIR Config Details',
            Target : '@UI.FieldGroup#Details'
        }]
    }]
);
//BOM Object Dependency
annotate service.ZPRODUCTCOND with @(UI: {
    SelectionFields : [PRODUCTID,PLANT],
    LineItem        : [
                {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : PRODUCTID
        },
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PLANT
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : BOMCOMPONENT
        },
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value :OBJECT_DEPENDENCY
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : CONSEQ
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_PROPERTY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : CHAR_VALUE
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : VALID_FROM
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : VALID_TO
        }
    ],
    HeaderInfo      : {
        Title          : {Value : PRODUCTID},
        Description    : {Value : PLANT},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    },
    FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : BOMCOMPONENT
        },
        {
            $Type : 'UI.DataField',
            Value : OBJECT_DEPENDENCY
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_PROPERTY
        },
        {
            $Type : 'UI.DataField',
            Value : CHAR_VALUE
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'bomod',
        Label  : 'BOM Object Dependency',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'BOM Object Dependency',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);
    //BOM Object Dependency
annotate service.ZPROD_BOM with @(UI: {
    SelectionFields : [LOCID,PRODUCTID],
    LineItem        : [
                {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : LOCID
        },
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PRODUCTID
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : ITEMNO
        },
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : COMPONENT
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : COMP_QTY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : VALID_FROM
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : VALID_TO
        }
    ],
    HeaderInfo      : {
        Title          : {Value : PRODUCTID},
        Description    : {Value : LOCID},
        TypeName       : 'Product BOM',
        TypeNamePlural : 'Products BOM',
    },
    FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ITEMNO
        },
        {
            $Type : 'UI.DataField',
            Value : COMPONENT
        },
        {
            $Type : 'UI.DataField',
            Value : COMP_QTY
        },
        {
            $Type : 'UI.DataField',
            Value : VALID_FROM
        },
        {
            $Type : 'UI.DataField',
            Value : VALID_TO
        }
        ]}
},
// Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'prdbom',
        Label  : 'Product BOM',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Product BOM',
            Target : '@UI.FieldGroup#Details'
        }]
    }]);