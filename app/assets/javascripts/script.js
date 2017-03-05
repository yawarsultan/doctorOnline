function switchToCamera(camId) {

   console.log("Cam clicked: " + camId);

   if(curCamId !== camId) { 

      curCamId = camId; 

      if(publisher) {

            if(session) {

                session.unpublish(publisher);

                publisher.destroy();

                console.log('unpublished');

            }

        } 

      var publisherProperties = {videoSource: curCamId, audioSource: curMicId, mirror: false}; 

      publisher = OT.initPublisher('pubDiv', publisherProperties,

      function (error) {

                        if (error) {

                            console.log(error);

                            return;

                        }

                        console.log('Publisher initialized');

       }); 

      publisher.on('streamDestroyed', function (event) {event.preventDefault();}); 

      session.publish(publisher, function(error){ 

            if(error) {

                console.log("error is: " + error.message);

                return;

            }

            console.log('published');

        });

      }

}