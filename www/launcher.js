"use strict";


var argscheck = require('cordova/argscheck'),
    exec = require('cordova/exec');


function VideoLauncher() {
}

/*
* successCallback - success callback
* errorCallback - error callback
* options
*   .token - Unique token is set for all video calls
*
*   .apikey - Static apikey is set for all the video sessions
*
*   .SessionID - Unique session id is set for all the combined sessions
*
*/

VideoLauncher.prototype.launch = function(successCallback, errorCallback, options) {

//  argscheck.checkArgs('ssFF*', 'VideoLauncher.launch', arguments);

  if(!options) {
    options = {};
  }

  var params = {
    apikey : options.apiKey ? options.apiKey : "44983462",
    token: options.token,
    sessionID: options.sessionID
  };

  if (typeof errorCallback != "function") {
    console.log("VideoLauncher.find failure: errorCallback parameter must be a function");
    return
  }

  if (typeof successCallback != "function") {
    console.log("VideoLauncher.find failure: successCallback parameter must be a function");
    return
  }

  exec(successCallback, errorCallback, "CDVVideoLauncher" , "videoLaunch", [params]);

}

var videoLauncher = new VideoLauncher();
module.exports = videoLauncher;