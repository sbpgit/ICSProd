using app.schema from '../db/schema';
//using CLASSES from '../db/schema';
using V_PRODUCTS from '../db/schema';
using V_CUSTGROUP from '../db/schema';
using V_LOCATION from '../db/schema';
using V_PIRCH from '../db/schema';
using V_PRDATR from '../db/schema';
using V_PRODCONFIG from '../db/schema';
using V_SALESHIS from '../db/schema';
using V_SALESH_CFG from '../db/schema';
using V_SALESH_CSY from '../db/schema';
//using V_SALESH_SMY from '../db/schema';

service CatalogService{
  entity ET_UserDetails
    as projection on schema.User_Details;

  @odata.draft.enabled
  entity ET_PRODUCT_CT
  as projection on schema.ZPRODUCT;
  @odata.draft.enabled
  entity ET_CUSTGRP_CT
  as projection on schema.ZCUSTOMERGROUP;
  @odata.draft.enabled
  entity ET_LOCATION_CT
  as projection on schema.ZLOCATION;
  @odata.draft.enabled
  entity ET_PIRCH_CTN
  as projection on schema.PIRCH_N;
  @odata.draft.enabled
  entity ET_PRODCONFIG_CTN
  as projection on schema.PRODCONFIG_N;
  @odata.draft.enabled
  entity ET_PRDATR_CTN
  as projection on schema.PRDATR_N;
     @odata.draft.enabled
  entity ET_PIRCH_CT
  as projection on schema.PIRCH;
  @odata.draft.enabled
  entity ET_PRODCONFIG_CT
  as projection on schema.PRODCONFIG;
  @odata.draft.enabled
  entity ET_PRDATR_CT
  as projection on schema.PRDATR;
 // @odata.draft.enabled
 @readonly
  entity ET_SALESHIS_CT
  as projection on schema.SALESHIS;
  // @odata.draft.enabled
 @readonly
  entity ET_SALESCSY_CT
  as projection on schema.SALESH_CSY;
 // @odata.draft.enabled
 @readonly
  entity ET_SALESCFG_CT
  as projection on schema.SALESH_CFG;
  
  @odata.draft.enabled
  entity ET_CLASS
    as projection on schema.ZCLASSES;

 // @readonly
  //entity ET_CLASSES
  //as projection on CLASSES;
  
  @readonly
  entity ET_PRODUCTS
  as projection on V_PRODUCTS;
  //annotate ET_PRODUCTS with @odata.draft.enabled;
  
 // @odata.draft.enabled
  //entity ET_PRODUCT
  //as projection on ET_PRODUCTS;
  
  @readonly
  entity ET_CUSTGRP
  as projection on V_CUSTGROUP;
  @readonly
  entity ET_LOCATION
  as projection on V_LOCATION;
  @readonly
  entity ET_PIRCH
  as projection on V_PIRCH;
  @readonly
  entity ET_PRODCONFIG
  as projection on V_PRODCONFIG;
  @readonly
  entity ET_PRDATR
  as projection on V_PRDATR;
  @readonly
  entity ET_SALESHIS
  as projection on V_SALESHIS;
  @readonly
  entity ET_SALESCSY
  as projection on V_SALESH_CSY;
  @readonly
  entity ET_SALESCFG
  as projection on V_SALESH_CFG;
  @readonly
  entity ET_CONDDECODE
  as projection on schema.ZPRODUCTCOND;

  @readonly
  entity ET_PRODBOM
  as projection on schema.ZPROD_BOM;
 
 function getTimeSeries() returns String;
}
