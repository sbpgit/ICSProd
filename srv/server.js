"use strict";
const express = require("express");
var hana = require('@sap/hana-client');
var osalesres = [],
    obomod = [],
    obom=[],
    oTSData1 = [];
const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", app => app.use(proxy()));

module.exports = cds.server;

		//Create DB connection with options from the bound service
		
		let client = require("@sap/hana-client");
		var connParams = {
			serverNode  : cds.env.requires.db.credentials.host + ":" + cds.env.requires.db.credentials.port,
            uid         : cds.env.requires.db.classicalSchema,
            pwd         : cds.env.requires.db.classicalSchemaPassword
        };
        //connect
        var conn = hana.createConnection();
        conn.connect(connParams);
// Fetch sales history config        
        let sqlStr = "SELECT * FROM SBPCICS_SALH_CFG";
        let stmt=conn.prepare(sqlStr);
        let results=stmt.exec();
        stmt.drop();
        for (var i = 0; i < results.length; i++)   {                     
            osalesres.push(result[i]);
        }

// Fetch sales history config        
        let sqlStr = "SELECT * FROM SBPCICS_SALH_CFG";
        let stmt=conn.prepare(sqlStr);
        let results=stmt.exec();
        stmt.drop();
        for (var i = 0; i < results.length; i++)   {                     
            osalesres.push(result[i]);
        }
        results.drop();

// Fetch sales history config        
        let sqlStr = "SELECT * FROM SBPCICS_BOM_OD";
        let stmt=conn.prepare(sqlStr);
        let results=stmt.exec();
        stmt.drop();
        for (var i = 0; i < results.length; i++)  {
            obom.push(results[i]);
        }    
        results.drop();   

// Fetch sales history config        
        let sqlStr = "SELECT * FROM SBPCICS_OBJDEPENDENCY";
        let stmt=conn.prepare(sqlStr);
        let results=stmt.exec();
        stmt.drop();
        for (var i = 0; i < result.length; i++) { 
            obomod.push(result[i]);
        } 
        results.drop();
// Logic for time series
        for( var i = 0; i < osalesres.length; i++){
        for( var j = 0; j < obomod.lenght ; j++ ){
            if( oTSData1.length === 0){
                oTSData1.
            }
        }
    }
/*conn.disconnect();
		conn.connect(connParams, (err) => {
			if (err) {
				return res.type("text/plain").status(500).send(`ERROR: ${JSON.stringify(err)}`);
			} else {
				conn.exec(`SELECT SESSION_USER, CURRENT_SCHEMA 
				             FROM "DUMMY"`, (err, result) => {
					if (err) {
						return res.type("text/plain").status(500).send(`ERROR: ${JSON.stringify(err)}`);
					} else {
						conn.disconnect();
						return res.type("application/json").status(200).send(result);
					}
				});
			}
			return null;
        });*/
       
    
//    });
 //   return app;
//}

/*var conn = hana.createConnection();
var asalescfg;
const conn_params = {
    serverNode  : cds.env.requires.db.credentials.host + ":" + cds.env.requires.db.credentials.port,
    uid         : cds.env.requires.db.classicalSchema,
    pwd         : cds.env.requires.db.classicalSchemaPassword
};
conn.prepare("SELECT * FROM SALESH_CFG",function(err,result){

});*/


