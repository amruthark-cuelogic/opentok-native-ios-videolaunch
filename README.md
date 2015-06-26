# opentok-native-ios-videolaunch

This plugin allows to connect to iOS native camera using opentok.

# Installation

cordova plugin add https://github.com/amruthark-cuelogic/opentok-native-ios-videolaunch

1. Add the following xml to your config.xml:

<!-- for iOS -->
  <feature name="VideoLauncher">
      <param name="ios-package" value="CDVVideoLauncher" />
  </feature>

2. Grab a copy of launcher.js, add it to your project and reference it in index.html:

<script type="text/javascript" src="js/launcher.js"></script>
3. Download the source files for iOS and copy them to your project.

iOS:

Copy CDVVideolauncher.* to platforms/ios/<ProjectName>/Plugins.
Copy the files from Multi-party-call/Classes folder to platforms/ios/<ProjectName>/Plugins
Copy the image files from Multi-party-call/ImageResources to platforms/ios/<ProjectName>/Resources

# Usage

First obtain the apikey and secret from Opentok.You need apikey , session id, token to launch the video call.This can be used for multiple sessions.To see multiple videos you need to swipe the arrows.

<pre>
  var options = {};
      options.apikey = apikey,
      options.sessionID = sessionID,
      options.token = token;

  window.plugins.videoLauncher.launch(
          successCallback, 
          errorCallback, 
          options);

   function successCallback(data) {
     alert(data);

     // Data is an object which contains eventType in it.
     // It used to end call and return to the app.
   }

   function errorCallback(message) {
     alert(message);
   }

</pre>