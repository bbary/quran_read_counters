import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application.Storage;

class CounterDelegate extends WatchUi.BehaviorDelegate {
    //private var _notify as Method(args as Dictionary or String or Null) as Void;
    var counterView;
    hidden var keyPressedTime = 0;
    
    //! Set up the callback to the view
    //! @param handler Callback method for when data is received
    //public function initialize(handler as Method(args as Dictionary or String or Null) as Void) {
        public function initialize() {
        WatchUi.BehaviorDelegate.initialize();
       // _notify = handler;
    }

    function setCounterView(aCounterView) {
        counterView = aCounterView;
    }


    //! Handle a key event
    //! @param evt The key event that occurred
    //! @return true if handled, false otherwise
    function onKeyPressed( evt ) {
        if (evt.getKey() == WatchUi.KEY_DOWN) {
            keyPressedTime = System.getTimer();
            return true;
        }
        return false;
    }

    function onKeyReleased( evt ) {
        if ((keyPressedTime > 0) && (evt.getKey() == WatchUi.KEY_DOWN)) {
            var delta = System.getTimer() - keyPressedTime; // ms since last press
            keyPressedTime = 0;
            if (delta > 1000) {
                // We have a hold of delta ms
                counterView.reset();
            } else {
                // We have a regular press
                counterView.decrement();
            }
            return true;
        }
        return false;
    }

    function onKey(evt){   
        if (evt.getKey() == WatchUi.KEY_ENTER) {
            counterView.change_counter();
        } else if (evt.getKey() == WatchUi.KEY_UP) {
            counterView.increment();
        } else if(evt.getKey() == WatchUi.KEY_MENU) {
            counterView.increment_by_10();
            return true;
        } /*else if(evt.getKey() == WatchUi.KEY_ESC) {


            return true;
        }*/
        return false;   
    }
/*
        //! Make the web request
    public function makeRequest() as Void {
        _notify.invoke("Executing Request");

        var options = {
            :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON,
            :headers => {
                "X-Access-Key" => "$2a$10$/fOFvWKFRElHpamfWiIxH.gdKtom/ZBtY7yRxlB6iWK64ytaNQ6GC",
                "X-Bin-Meta" => "false"
            }
        };

        Communications.makeWebRequest(
            "https://api.jsonbin.io/v3/b/65a2a6f4266cfc3fde779918/",
            {},
            options,
            method(:onReceive)
        );
    }

       //! Receive the data from the web request
    //! @param responseCode The server response code
    //! @param data Content from a successful request
    public function onReceive(responseCode as Number, data as Dictionary<String, Object?> or String or Null) as Void {
        if (responseCode == 200) {
            _notify.invoke(data);
        } else {
            _notify.invoke("Failed to load  Error: " + responseCode);
        }
    }  
    */
    
}