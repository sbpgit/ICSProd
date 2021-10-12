//namespace app.schema;
using {    
  managed,
  cuid,
  sap.common
} from '@sap/cds/common';

context app.schema {
// Table for Location
entity ZLOCATION {
    key LOCID : String(4) @title: 'Location ';
    LOCDESC   : String(30)  @title: 'Location Descritpion';
    LOCTYPE   : String(1)  @title: 'Location Type' ; 
    LATITUDE  : Decimal(10,8) @title: 'Latitude' ;
    LONGITUTE : Decimal(10,8) @title: 'Longitude' ;
    RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
    RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
    RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
    RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
    RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ;  
    CHANGED_DATE: Date  @title: 'Changed Date' ; 
    CHANGED_BY: String(12)  @title: 'Changed By' ; 
    CREATED_DATE: Date  @title: 'Created Date' ; 
    CREATED_BY: String(12)  @title: 'Created By' ; 
    CHANGED_TIME: Time  @title: 'Changed Time' ; 
    CREATED_TIME: Time  @title: 'Created Time' ;  

};

// Customer group
entity ZCUSTOMERGROUP: managed{
    key CUSTGROUP : String(2) @title: 'Customer Group';
    CUSTDESC : String(20)    @title: 'Customer Description';
    RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
    RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
    RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
    RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
    RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ;  
    CHANGED_DATE: Date  @title: 'Changed Date' ; 
    CHANGED_BY: String(12)  @title: 'Changed By' ; 
    CREATED_DATE: Date  @title: 'Created Date' ; 
    CREATED_BY: String(12)  @title: 'Created By' ; 
    CHANGED_TIME: Time  @title: 'Changed Time' ; 
    CREATED_TIME: Time  @title: 'Created Time' ;  
};

// Product
entity ZPRODUCT: managed{
    key PRODUCTID : String(40)    @title : 'Product';  
        PRODDESC   : String(40)   @title : 'Product Description';              
        PRODFAMILY :   String(30) @title : 'Product Family';
        PRODGROUP  :  String(30)  @title : 'Product Group';
        PRODMODEL  :  String(30)  @title : 'Product Model';
        PRODMRANGE :  String(30)  @title : 'Product Range';
        PRODSERIES :  String(30)  @title : 'Product Series';
        MATERIALTYPE : String(4)  @title : 'Product Type';
        UOM : String(3)           @title : 'Unit of Measure';
        LOCID : String(4)         @title: 'Location ';
        AUTHGROUP : String(4) @title: 'Authorization Group';
        PLMSTATUS : String(10);
        CONFIGURABLE: String(1);
        PRODHIERARCHY1 :String(18);
        PRODHIERARCHY2 :String(18);
        PRODHIERARCHY3 :String(18);
        PRODHIERARCHY4 :String(18);
        PRODHIERARCHY5 :String(18);
        PRODHIERARCHY6 :String(18);
        CONFIGMATERIAL : String(40);
};
// DEcode condition ECC
entity ZPRODUCTCOND {
    key PRODUCTID : String(40)    @title : 'Product';  
    key PLANT:        String(4) @title : 'Plant';
    key BOMCOMPONENT: String(40) @title : 'BOM Component';
    key OBJECT_DEPENDENCY: String(30) @title:'Object Dependency';
    key CONSEQ:            String(10) @title:'Condition Sequence';
    key CHAR_PROPERTY:     String(50) @title:'Characteristic';
    key CHAR_VALUE:        String(50) @title:'Characteristic Value'; 
    COMP_QTY    :   String(18) @title:'Component Quantity';
    COMP_UNIT   :   String(3) @title: 'Component Unit';
    VALID_FROM : Date @title: 'Valid From';
    VALID_TO : Date @title: 'Valid To';
};

// Product and LOcation table
entity ZLOCATION_PRODUCT{
    key LOCID      :      Association to ZLOCATION;
    key PRODUCTID  : Association to ZPRODUCT;
        LOTSIZE    : String(2);
        PROCUREMENT_TYPE   : String(1);
        PLANNING_STRATEGY  : String(2);
};
// Classes
entity ZCLASSES:managed{	
    key INTRNO_CLASS: String(18);
	CLASS_NAME: String(20);
	CLASS_TYPE: String(3);
	CLASS_DESC: String(50);
	AUTHGROUP: String(4);
};
	
//Characteristitcs	
entity ZCHARACTERISTICS: managed{
    key INTRNO_CLASS: String(18);
	key INTRNO_CHAR : String(10);
	CHAR_NAME: String(30);
	CHAR_DESC: String(30);
	CHAR_GROUP: String(10);
	CHAR_TYPE: String(4);
	ENTRY_REQ: String(1);
	CHAR_CATGRY: String(40);
    };
// Characteristic Values	
entity ZCHARACTER_VALUES: managed{
    key INTRNO_CHAR: String(10); //Association to ZCHARACTERISTICS;
	key INTRNO_CHARVAL: String(10);
	CHAR_VALUE    : String(70);
	CHARVAL_DESC  : String(30);
	CATCH_ALL     : String(1); 
};

entity ZCLASSCHARVAL{
    key INTRNO_CLASS: String(18);
	key INTRNO_CHAR : String(10);
	key INTRNO_CHARVAL: String(10);
	CLASS_NAME: String(20);
	CHAR_NAME: String(30);
	CHAR_VALUE    : String(70);
	CHARVAL_DESC  : String(30);
    AVGPERCENT : Decimal(10,3);
    AVGUSAGEPROB :  Decimal(10,3);
};
entity ZBOMCONFIG{
    key PRODUCTID :String(40);
    key INTCOUNTER: String(10);
    ITEMNO: String(5);
    COMPONENT: String(40);
    COMP_QTY : Decimal(13,3);
    RULE : String(150);
	CLASS_NAME: String(20);
	CHAR_NAME: String(30);
	CHAR_VALUE    : String(70);
	CHARVAL_DESC  : String(30);
    VALID_FROM : Date;
    VALID_TO : Date;
    INTRCOM1 : String(50);
    INTRCOM2 : String(50);
};
//Object dependency
entity ZOBJECTDEPENDENCY{
    key INTRNO_OD: String(10);
    OD_NAME  : String(30);
    OD_TYPE  : String(4);
    OD_DESC  : String(30);
    AUTHGROUP : String(3);
    OD_CONDITIONBLOB : LargeBinary;
    OD_DEPENDTYPE: String(1);
};

//Product planning
entity ZPROD_PLANNING{
    key LOCID: Association to ZLOCATION;
    key PRODUCTID :Association to ZPRODUCT;
    key INTRNO_OD : Association to ZOBJECTDEPENDENCY;
     
};
//Product Restrictions Assigment
entity ZPROD_RESTRICT_ASSIGN{
    key LOCID: Association to ZLOCATION;
    key PRODUCTID :Association to ZPRODUCT;
// rESTRICTION NUMBER
};
//Product BOM ECC table
entity ZPROD_BOM:managed{
    key LOCID: String(4) @title: 'Location ';//Association to ZLOCATION;//
    key PRODUCTID : String(40) @title: 'Product';//Association to ZPRODUCT;
    //key INTCOUNTER: String(10) @title: 'Location ';
    ITEMNO: String(5) @title: 'ITEM Number ';
    COMPONENT: String(40) @title: 'Component';
    COMP_QTY : Decimal(13,3) @title: 'Component Quantity';
    VALID_FROM : Date @title: 'Valid From';
    VALID_TO : Date @title: 'Valid To';

};
// Product BOM - Object Dependency
entity ZPRODBOM_OD{    
    key LOCID: Association to ZLOCATION;
    key PRODUCTID   : Association to ZPRODUCT;
    key INTRNO_OD   : Association to ZOBJECTDEPENDENCY;
};
// New Product
entity ZPRODUCT_NEW: managed{
    key LOCID         : String(4);
    key PRODUCTID_NEW : String(40);
    key REF_PROD      : String(40);
    HISTR_VALID_FROM  : Date;
    HISTR_VALID_TO    : Date;
};
//Product Configuration
entity ZPROD_CONFIGNEW: managed{
    key PRODUCTID_NEW : String(40); 
    key REF_PROD      : String(40); 
    key CHAR_VALUENEW : String(70);
    REF_CHAR_VALUE    : String(70);
};
//User Roles
entity ZUSERROLES:managed{
    key USERROLE: String(20);
    ROLE_DESC : String(40);
};
//Authorization
entity ZUSER_FUNCTIONS: managed{
    key AUTHGROUP: String(20);
    AUTH_DESC : String(40);
};
entity User_Details {
    CREATED_BY : String(12);
    CREATED_DATE : Date;
};

entity PIRCH_N {
key MATERIAL: String(40)  @title: 'Material' ; 
key PLANT: String(4)  @title: 'Plant' ; 
key REQ_DATE: Date  @title: 'Req Date' ; 
key PT_NUMBER: String(10)  @title: 'PT Number' ; 
key PT_LINE: String(5)  @title: 'PT Line' ; 
key SESSION_ID: String(32)  @title: 'Session ID' ; 
CHARACTERSTIC: String(30)  @title: 'Characteristic ' ; 
CHARACTERSTIC_VALUE: String(70)  @title: 'Characteristic Value' ; 
FLAG_USAGE: String(1)  @title: 'Flag Usage' ; 
PROCESS_FLAG: String(1)  @title: 'Process Flag' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CH_QTY: Double  @title: 'Change Qty' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

entity PRDATR_N {
key LOCATION_ID: String(4)  @title: 'Location ID' ; 
key PRODUCT_ID: String(40)  @title: 'Product Id' ; 
PRODUCT_FAMILY: String(30)  @title: 'Product Family' ; 
PRODUCT_GROUP: String(30)  @title: 'Product group' ; 
PRODUCT_MODEL: String(30)  @title: 'Product Model' ; 
PRODUCT_MRANGE: String(30)  @title: 'Product Model Range' ; 
PRODUCT_SERIES: String(30)  @title: 'Product Series' ; 
RANK: Double  @title: 'RANK: RANK' ; 
};

entity PRODCONFIG_N {
key PRODUCT_ID: String(40)  @title: 'Product Id' ; 
key LOCATION_ID: String(4)  @title: 'Location ID' ; 
key CLASS: String(18)  @title: 'Class' ; 
key CHAR_NAME: String(30)  @title: 'Characteristic Name' ; 
key CHAR_VALUE: String(70)  @title: 'Characteristic Value' ; 
CHAR_VALUE_DESC: String(70)  @title: 'Character Value Desc' ; 
CHAR_ATTR: String(30)  @title: 'Characteristic Attribute' ; 
CHAR_DESC: String(50)  @title: 'Characteristic Description' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHNAGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

entity PIRCH {
key MATERIAL: String(40)  @title: 'Material' ; 
key PLANT: String(4)  @title: 'Plant' ; 
key REQ_DATE: Date  @title: 'Req Date' ; 
key PT_NUMBER: String(10)  @title: 'PT Number' ; 
key PT_LINE: String(5)  @title: 'PT Line' ; 
key SESSION_ID: String(32)  @title: 'Session ID' ; 
CHARACTERSTIC: String(30)  @title: 'Characteristic ' ; 
CHARACTERSTIC_VALUE: String(70)  @title: 'Characteristic Value' ; 
FLAG_USAGE: String(1)  @title: 'Flag Usage' ; 
PROCESS_FLAG: String(1)  @title: 'Process Flag' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CH_QTY: Double  @title: 'Change Qty' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

entity PRDATR {
key LOCATION_ID: String(4)  @title: 'Location ID' ; 
key PRODUCT_ID: String(40)  @title: 'Product Id' ; 
PRODUCT_FAMILY: String(30)  @title: 'Product Family' ; 
PRODUCT_GROUP: String(30)  @title: 'Product group' ; 
PRODUCT_MODEL: String(30)  @title: 'Product Model' ; 
PRODUCT_MRANGE: String(30)  @title: 'Product Model Range' ; 
PRODUCT_SERIES: String(30)  @title: 'Product Series' ; 
RANK: Double  @title: 'RANK: RANK' ; 
};

entity PRODCONFIG {
key PRODUCT_ID: String(40)  @title: 'Product Id' ; 
key LOCATION_ID: String(4)  @title: 'Location ID' ; 
key CLASS: String(18)  @title: 'Class' ; 
key CHAR_NAME: String(30)  @title: 'Characteristic Name' ; 
key CHAR_VALUE: String(70)  @title: 'Characteristic Value' ; 
CHAR_VALUE_DESC: String(70)  @title: 'Character Value Desc' ; 
CHAR_ATTR: String(30)  @title: 'Characteristic Attribute' ; 
CHAR_DESC: String(50)  @title: 'Characteristic Description' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHNAGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

entity SALESHIS {
Key SALES_DOC: String(10)  @title: 'Sales Document' ; 
Key SALES_DOC_ITEM: String(6)  @title: 'Sales Document Item' ; 
DOC_DATE: Date  @title: 'Document Created on' ; 
SCHEDULE_LINE_NUMBER: String(4)  @title: 'Schedule Line Number' ; 
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
REASON_REJ: String(2)  @title: 'Reason rejection' ; 
UOM: String(3)  @title: 'UOM' ; 
MAT_AVAIL_DATE: Date  @title: 'Material Availability Date' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
LOCATION_ID: String(4)  @title: 'Location ID' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CONFIRMED_QTY: Decimal(13, 3)  @title: 'Confirmed Qty' ; 
ORD_QTY: Decimal(13, 3)  @title: 'Order Quantity' ; 
NET_VALUE: Decimal(15, 2)  @title: 'Net Value' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
RANK: Double  @title: 'RANK' ; 
};

entity SALESH_CFG {
key SALES_DOCUMENT: String(10)  @title: 'Sales Document' ; 
key SALES_DOCUMENT_ITEM: String(6)  @title: 'Sales Document Item' ; 
key CHARACTERSTIC: String(30)  @title: 'Characterstic' ; 
CHARACTERSTIC_VALUE: String(70)  @title: 'Characterstic Value' ; 
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
PROD_AVAILABILITY_DT: Date  @title: 'Prod Availability Date' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
RANK: Double  @title: 'RANK' ; 
};

entity SALESH_CSY {
key WEEK_DATE: Date  @title: 'Week Date'; 
key CHARACTERSTICS: String(30)  @title: 'Characteristic' ; 
key CHARACTERSTICS_VALUE: String(70)  @title: 'Characteristic Value' ; 
key CLASS: String(18)  @title: 'Class' ; 
key PRODUCT_ID: String(40)  @title: 'Product ID' ; 
key CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
LOCATION_ID: String(4)  @title: 'Location ID' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
SALEHIST_PROD: Decimal(13, 3)  @title: 'Confirmed Quantity' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created TIme' ; 
RANK: Double  @title: 'RANK' ; 
};
// BOM object dependency
entity ZBOM_OD{
    key LOCID: String(4) @title: 'Location ';//Association to ZLOCATION;//
    key PRODUCTID : String(40) @title: 'Product';//Association to ZPRODUCT;
    key ITEMNO: String(5) @title: 'ITEM Number ';
    key COMPONENT: String(40) @title: 'Component';
    key OBJECT_DEPENDENCY: String(30) @title:'Object Dependency';
    OD_DESC: String(30) @title:'Object Dependency description';
    COMP_QTY    :   String(18) @title:'Component Quantity';
    VALID_FROM : Date @title: 'Valid From';
    VALID_TO : Date @title: 'Valid To';
};

entity client_configurations:managed{
 key SCHEMA_NAME: String(127);
 key CLIENT_ID: String(100);
 CLIENT_NAME: String(225);
 COUNTER_FLAG: String(1);
};
}

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_PRODUCTS] {
PRODUCTID: String(40)  @title: 'Product ID' ; 
PRODUCTDESC: String(40)  @title: 'Product Desc' ; 
PRODUCTFAMILY: String(40)  @title: 'Product Family' ; 
PRODUCTGROUP: String(20)  @title: 'Product Group' ; 
PRODUCTMODEL: String(20)  @title: 'Product Model' ; 
PRODMODELRANGE: String(20)  @title: 'Product Model Range' ; 
PRODSERIES: String(20)  @title: 'Product Series' ; 
RANK: Double  @title: 'RANK' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_CUSTGROUP] {
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
CUSTOMER_DESC: String(20)  @title: 'Customer Desc' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHANGEDATE: Date  @title: 'Changed Date' ; 
CHNAGD_BY: String(12)  @title: 'Changed By' ; 
CREATEDBY: Date  @title: 'Created Date' ; 
CREATEDDATE: String(12)  @title: 'Created By' ; 
CHANGE_TIME: Time  @title: 'Changed Time' ; 
CREATEDTIME: Time  @title: 'Created Time' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_LOCATION] {
LOCATION_ID: String(4)  @title: 'Location ID' ; 
LOCATION_DESC: String(30)  @title: 'Location Descritpion' ; 
LOCATION_TYPE: String(1)  @title: 'Location Type' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ;  
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ;  
RANK: Double  @title: 'RANK: RANK' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_PIRCH] {
MATERIAL: String(40)  @title: 'Material' ; 
PLANT: String(4)  @title: 'Plant' ; 
REQ_DATE: Date  @title: 'Req Date' ; 
PT_NUMBER: String(10)  @title: 'PT Number' ; 
PT_LINE: String(5)  @title: 'PT Line' ; 
SESSION_ID: String(32)  @title: 'Session ID' ; 
CHARACTERSTIC: String(30)  @title: 'Characteristic ' ; 
CHARACTERSTIC_VALUE: String(70)  @title: 'Characteristic Value' ; 
FLAG_USAGE: String(1)  @title: 'Flag Usage' ; 
PROCESS_FLAG: String(1)  @title: 'Process Flag' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CH_QTY: Double  @title: 'Change Qty' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_PRDATR] {
LOCATION_ID: String(4)  @title: 'Location ID' ; 
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
PRODUCT_FAMILY: String(30)  @title: 'Product Family' ; 
PRODUCT_GROUP: String(30)  @title: 'Product group' ; 
PRODUCT_MODEL: String(30)  @title: 'Product Model' ; 
PRODUCT_MRANGE: String(30)  @title: 'Product Model Range' ; 
PRODUCT_SERIES: String(30)  @title: 'Product Series' ; 
RANK: Double  @title: 'RANK: RANK' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_PRODCONFIG]{
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
LOCATION_ID: String(4)  @title: 'Location ID' ; 
CLASS: String(18)  @title: 'Class' ; 
CHAR_NAME: String(30)  @title: 'Characteristic Name' ; 
CHAR_VALUE: String(70)  @title: 'Characteristic Value' ; 
CHAR_VALUE_DESC: String(70)  @title: 'Character Value Desc' ; 
CHAR_ATTR: String(30)  @title: 'Characteristic Attribute' ; 
CHAR_DESC: String(50)  @title: 'Characteristic Description' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHNAGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_SALESHIS] {
SALES_DOC: String(10)  @title: 'Sales Document' ; 
SALES_DOC_ITEM: String(6)  @title: 'Sales Document Item' ; 
DOC_DATE: Date  @title: 'Document Created on' ; 
SCHEDULE_LINE_NUMBER: String(4)  @title: 'Schedule Line Number' ; 
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
REASON_REJ: String(2)  @title: 'Reason rejection' ; 
UOM: String(3)  @title: 'UOM' ; 
MAT_AVAIL_DATE: Date  @title: 'Material Availability Date' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
LOCATION_ID: String(4)  @title: 'Location ID' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CONFIRMED_QTY: Decimal(13, 3)  @title: 'Confirmed Qty' ; 
ORD_QTY: Decimal(13, 3)  @title: 'Order Quantity' ; 
NET_VALUE: Decimal(15, 2)  @title: 'Net Value' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
RANK: Double  @title: 'RANK' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_SALESH_CFG] {
SALES_DOCUMENT: String(10)  @title: 'Sales Document' ; 
SALES_DOCUMENT_ITEM: String(6)  @title: 'Sales Document Item' ; 
PRODUCT_ID: String(40)  @title: 'Product Id' ; 
CHARACTERSTIC: String(30)  @title: 'Characterstic' ; 
CHARACTERSTIC_VALUE: String(70)  @title: 'Characterstic Value' ; 
PROD_AVAILABILITY_DT: Date  @title: 'Prod Availability Date' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created Time' ; 
RANK: Double  @title: 'RANK' ; 
};

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_SALESH_CSY] {
WEEK_DATE: Date  @title: 'Week Date' ; 
CHARACTERSTICS: String(30)  @title: 'Characteristic' ; 
CHARACTERSTICS_VALUE: String(70)  @title: 'Characteristic Value' ; 
CLASS: String(18)  @title: 'Class' ; 
PRODUCT_ID: String(40)  @title: 'Product ID' ; 
CUSTOMER_GROUP: String(2)  @title: 'Customer Group' ; 
LOCATION_ID: String(4)  @title: 'Location ID' ; 
RESERVE_FIELD1: String(20)  @title: 'Reserve Field1' ; 
RESERVE_FIELD2: String(20)  @title: 'Reserve Field2' ; 
RESERVE_FIELD3: String(20)  @title: 'Reserve Field3' ; 
RESERVE_FIELD4: String(20)  @title: 'Reserve Field4' ; 
RESERVE_FIELD5: String(20)  @title: 'Reserve Field5' ; 
CHANGED_DATE: Date  @title: 'Changed Date' ; 
CHANGED_BY: String(12)  @title: 'Changed By' ; 
CREATED_DATE: Date  @title: 'Created Date' ; 
CREATED_BY: String(12)  @title: 'Created By' ; 
SALEHIST_PROD: Decimal(13, 3)  @title: 'Confirmed Quantity' ; 
CHANGED_TIME: Time  @title: 'Changed Time' ; 
CREATED_TIME: Time  @title: 'Created TIme' ; 
RANK: Double  @title: 'RANK' ; 
}