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
/*
module.exports = () => {
	var app = express.Router();

	//Hello Router
	app.get("/", (req, res) => {
		let client = require("@sap/hana-client");
		//Lookup HANA DB Connection from Bound HDB Container Service
		const xsenv = require("@sap/xsenv");
		let hanaOptions = xsenv.getServices({
			hana: {
				tag: "hana"
			}
		});
		//Create DB connection with options from the bound service
		let conn = client.createConnection();
		var connParams = {
			serverNode  : cds.env.requires.db.credentials.host + ":" + cds.env.requires.db.credentials.port,
            uid         : cds.env.requires.db.classicalSchema,
            pwd         : cds.env.requires.db.classicalSchemaPassword
        };
        //connect
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
        });
        conn.exec("SELECT * FROM SALESH_CFG",function(err,result){
            for (var i = 0; i < result.length; i++)   {                     
            osalesres.push(result[i]);
        }
    });
        conn.exec("SELECT * FROM SBPCICS_BOM",function(err,result){
        for (var i = 0; i < result.length; i++)  {
            obom.push(result[i]);

        }
    });
        conn.exec("SELECT * FROM SBPCICS_BOM_OD",function(err,result){
        for (var i = 0; i < result.length; i++) { 
            obomod.push(result[i]);
        }
        });
    for( var i = 0; i < obomod.length; i++){
        for( var j = 0; j < obom.lenght ; j++ ){
            if( oTSData1.length === 0){
                
            }
        }
    }
    });
    return app;
}

/*var conn = hana.createConnection();
var asalescfg;
const conn_params = {
    serverNode  : cds.env.requires.db.credentials.host + ":" + cds.env.requires.db.credentials.port,
    uid         : cds.env.requires.db.classicalSchema,
    pwd         : cds.env.requires.db.classicalSchemaPassword
};
conn.prepare("SELECT * FROM SALESH_CFG",function(err,result){

});*/


