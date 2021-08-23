___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "dataLayer Generator",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Based on your key value pairs input, this template will generate a dataLayer (via a dataLayer.push()) on the event you decide.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SIMPLE_TABLE",
    "name": "simpleTable",
    "displayName": "Set of key-value pairs you want to push to the dataLayer",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "",
        "name": "key",
        "type": "TEXT",
        "valueHint": "Insert your key here."
      },
      {
        "defaultValue": "",
        "displayName": "",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "newRowButtonText": "Add a new key - value pair"
  },
  {
    "type": "TEXT",
    "name": "eventName",
    "displayName": "Event name you want to push to the dataLayer",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//API's to work with the dataLayer
const createQueue = require('createQueue');
const dataLayerPush = createQueue('dataLayer');
const makeTableMap = require('makeTableMap');
//API's to console log
const log = require('logToConsole');


//If there are dataLayer key-value pairs configured
if(data.simpleTable){
  //If there is also an event name configured
  if(data.eventName){
    
    let dataLayerKeyValues = makeTableMap(data.simpleTable, 'key', 'value');
    let dataLayerEvent = data.eventName;
    dataLayerKeyValues.event = dataLayerEvent;
    dataLayerPush(dataLayerKeyValues);
    //Uncomment the following line in order to log in your browser's console the object being pushed to your dataLayer
    /*log('Hay evento: ', dataLayerKeyValues);*/

  }
 //If there are dataLayer key-value pairs configured but no event name
  else{
  
     const dataLayerKeyValues = makeTableMap(data.simpleTable, 'key', 'value');
      dataLayerPush(dataLayerKeyValues);
      //Uncomment the following line in order to log in your browser's console the object being pushed to your dataLayer
     /*log('No hay evento: ', dataLayerKeyValues);*/
  
  } 
}
//If there are no key-value pairs but there is an event configured  
else{
  
  if(data.eventName){
  
    let dataLayerEvent = data.eventName;
    dataLayerPush({'event':dataLayerEvent});
    //Uncomment the following line in order to log in your browser's console the object being pushed to your dataLayer
    /*log('No simpleTable defined', dataLayerEvent);*/

  
  }


}



// Ejecute data.gtmOnSuccess cuando la etiqueta haya finalizado.
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 23/8/2021 12:11:33



