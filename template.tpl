___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (the "Gallery TOS") and
the Google Developer Terms of Service located at
https://developers.google.com/terms (the "Google Developer TOS).

___INFO___

{
  "type": "TAG",
  "id": "cvt_aidisclose",
  "version": 1,
  "securityGroups": [],
  "displayName": "AIDisclose — AI Disclosure",
  "brand": {
    "id": "brand_aidisclose",
    "displayName": "AIDisclose"
  },
  "description": "Loads the dependency-free aidisclose.js snippet: the EU AI Act Article 50 / California SB 942 interaction-disclosure banner, visible AI-content labels, and machine-readable page metadata, localized in 28 languages. Cookieless, no tracking.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteKey",
    "displayName": "Site key (optional)",
    "simpleValueType": true,
    "help": "Your AIDisclose site key. Leave blank to auto-read /.well-known/ai-disclosure.json on your own domain."
  },
  {
    "type": "SELECT",
    "name": "theme",
    "displayName": "Theme",
    "selectItems": [
      {
        "value": "auto",
        "displayValue": "Auto (follow visitor OS preference)"
      },
      {
        "value": "light",
        "displayValue": "Light"
      },
      {
        "value": "dark",
        "displayValue": "Dark"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "auto"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const copyFromWindow = require('copyFromWindow');

const SRC = 'https://cdn.aidisclose.io/v1/aidisclose.js';

// Pass optional configuration to the snippet before it loads. Never clobber a
// config the site already defined itself.
const existing = copyFromWindow('AIDiscloseConfig');
if (!existing && (data.siteKey || (data.theme && data.theme !== 'auto'))) {
  setInWindow('AIDiscloseConfig', {
    siteKey: data.siteKey,
    theme: data.theme
  }, true);
}

injectScript(SRC, data.gtmOnSuccess, data.gtmOnFailure, SRC);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.aidisclose.io/v1/aidisclose.js"
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
                    "string": "AIDiscloseConfig"
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

scenarios:
- name: Injects the snippet with default settings
  code: |-
    const mockData = { theme: 'auto' };
    runCode(mockData);
    assertApi('injectScript').wasCalled();


___NOTES___

Loads https://cdn.aidisclose.io/v1/aidisclose.js. Optional fields set
window.AIDiscloseConfig (siteKey, theme) before load, and never overwrite a
config the page already defined. Trigger the tag on All Pages. Docs:
https://aidisclose.io/docs/install/
