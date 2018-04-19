'use strict';

const {google} = require('googleapis');

const cloudbuild = google.cloudbuild('v1');
const triggers = cloudbuild.projects.triggers;

async function main () {
  // The `getClient` method will choose a service based authentication model
  const auth = await google.auth.getClient({
    // Scopes can be specified either as an array or as a single, space-delimited string.
    scopes: ['https://www.googleapis.com/auth/cloud-platform']
  });

  // Obtain the current project Id
  const project = await google.auth.getDefaultProjectId();

  // Setup a resuable object for method calls
  const creds = { projectId: project, auth };

  // Get the list of build triggers
  //const trig = await triggers.list(creds);
  //console.log(trig.data); 

  const trigger = 'e50d68ee-819b-41f7-842e-6fa6a6b632f1';
  const repoSource = {
    //  "projectId": string,
    //  "repoName": string,
    //  "dir": string,

    // Union field revision can be only one of the following:
        branchName: 'master',
    //  "tagName": string,
    //  "commitSha": string,
    // End of list of possible types for union field revision.
  }

  //const runTrig = await triggers.run(Object.assign({triggerId: 'e6ca4a7e-a9a4-4955-9c75-51208a27dd88'}, creds));
  const runTrig = await triggers.run({projectId: project, triggerId: trigger, auth, resource: repoSource});
  console.log(runTrig);

  //const getTrig = await triggers.get({projectId: project, triggerId: trigger, auth});
  //console.log(getTrig.data);

}

main().catch(console.error);
