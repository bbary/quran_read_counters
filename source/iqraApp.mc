import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class iqraApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        var counterView = new CounterView();
        //var counterDelegate = new CounterDelegate(counterView.method(:onReceive));
        var counterDelegate = new CounterDelegate();
        counterDelegate.setCounterView(counterView);
        return [ counterView, counterDelegate ];
    }

    (:glance)
    function getGlanceView() {
        return [ new CounterGlanceView() ];
    }
}

function getApp() as iqraApp {
    return Application.getApp() as iqraApp;
}