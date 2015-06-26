# opentok-native-ios-videolaunch

This plugin allows to connect to iOS native camera using opentok.

# Installation

cordova plugin add https://github.com/amruthark-cuelogic/opentok-native-ios-videolaunch

# Manual installation

1. Add the following xml to your config.xml:

<div class="highlight highlight-xml">
  <pre><span class="pl-c">&lt;!-- for iOS --&gt;</span>
  <span class="pl-ent">feature</span><span class="pl-e">name</span>=<span class="pl-s"><span class="pl-pds">"</span>VideoLauncher<span class="pl-pds">"</span></span>&gt;
    &lt;<span class="pl-ent">param</span> <span class="pl-e">name</span>=<span class="pl-s"><span class="pl-pds">"</span>ios-package<span class="pl-pds">"</span></span> <span class="pl-e">value</span>=<span class="pl-s"><span class="pl-pds">"</span>CDVVideoLauncher<span class="pl-pds">"</span></span> /&gt;
&lt;/<span class="pl-ent">feature</span>&gt;</pre></div>

2. Grab a copy of launcher.js, add it to your project and reference it in index.html:
    <pre>&lt;<span class="pl-ent">script</span> <span class="pl-e">type</span>=<span class="pl-s"><span class="pl-pds">"</span>text/javascript<span class="pl-pds">"</span></span> <span class="pl-e">src</span>=<span class="pl-s"><span class="pl-pds">"</span>js/launcher.js<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">script</span>&gt;</pre>

3. Download the source files for iOS and copy them to your project.

 iOS:
  <ul>
    <li>Copy CDVVideolauncher.* to platforms/ios/<ProjectName>/Plugins.</li>
    <li>Copy the files from Multi-party-call/Classes folder to platforms/ios/<ProjectName>/Plugins</li>
    <li>Copy the image files from Multi-party-call/ImageResources to platforms/ios/<ProjectName>/Resources</li>
  </ul>

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