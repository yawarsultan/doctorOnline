var audioInputDevices;
var videoInputDevices;
var videoOption = {width: 400, height: 400}
OT.getDevices(function(error, devices) {
  audioInputDevices = devices.filter(function(element) {
    return element.kind == "audioInput";
  });
  videoInputDevices = devices.filter(function(element) {
    return element.kind == "videoInput";
  });
  for (var i = 0; i < audioInputDevices.length; i++) {
    console.log("audio input device: ", audioInputDevices[i].deviceId);
  }
  for (i = 0; i < videoInputDevices.length; i++) {
    console.log("video input device: ", videoInputDevices[i].deviceId);
  }
});


var videoSource = TB.initPublisher(gon.opentok.apiKey, 'videoSource', videoOption);
session.publish(videoSource);
// var pubOptions =
//   {
//     audioSource: audioInputDevices[0].deviceId,
//     videoSource: videoInputDevices[0].deviceId
//   };
// var publisher = OT.initPublisher(null, pubOptions, function(error) {
//   console.log("OT.initPublisher error: ", error);
// });