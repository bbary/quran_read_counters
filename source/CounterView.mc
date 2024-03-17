import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application.Storage;

class CounterView extends WatchUi.View {
    //var counters= [0,0,0];
    var txt_counters;
    var selected_counter_num = 0;
    var counter;


    //! Constructor
    public function initialize() {
        View.initialize();
        txt_counters = new Array<WatchUi.Text>[3];
        selected_counter_num = getSelected_counter_numFromStorage();
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }
        
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {  
    }

    // Update the view
    function onUpdate(dc) {
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        
        txt_counters[0] = new WatchUi.Text({
            //:text=>counters[0].toString(),
            :text=>getCounterFromStorage(0).toString(),
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_NUMBER_MEDIUM,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>LAYOUT_VALIGN_TOP
        });

        txt_counters[1] = new WatchUi.Text({
            //:text=>counters[1].toString(),
            :text=>getCounterFromStorage(1).toString(),
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_NUMBER_MEDIUM,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });  

        txt_counters[2] = new WatchUi.Text({
            //:text=>counters[2].toString(),
            :text=>getCounterFromStorage(2).toString(),
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_NUMBER_MEDIUM,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>LAYOUT_VALIGN_BOTTOM
        });

        txt_counters[selected_counter_num].setColor(Graphics.COLOR_RED);
        txt_counters[selected_counter_num].setFont(Graphics.FONT_NUMBER_HOT);
        
        
        txt_counters[0].draw(dc);
        txt_counters[1].draw(dc);
        txt_counters[2].draw(dc);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);    
        /*
        "الورد"     "wird"
        "المراجعة"  "mouraj"
        "الحفظ"     "hifd"  
        */
        dc.drawText(210, 60, Graphics.FONT_GLANCE, "الورد",Graphics.TEXT_JUSTIFY_LEFT|Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(210, 140, Graphics.FONT_GLANCE, "المراجعة",Graphics.TEXT_JUSTIFY_LEFT|Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(200, 220, Graphics.FONT_GLANCE, "الحفظ",Graphics.TEXT_JUSTIFY_LEFT|Graphics.TEXT_JUSTIFY_VCENTER);
        
    }


    function increment() {
        //counters[selected_counter_num] +=1;
        counter = getCounterFromStorage(selected_counter_num);
        setCounterAtStorage(selected_counter_num, counter+1);
        requestUpdate();
    }

    function increment_by_10() {
        //counters[selected_counter_num] +=10;
        counter = getCounterFromStorage(selected_counter_num);
        setCounterAtStorage(selected_counter_num, counter+10);
        requestUpdate();
    }

    function decrement() {
        //counters[selected_counter_num] -=1;
        counter = getCounterFromStorage(selected_counter_num);
        setCounterAtStorage(selected_counter_num, counter-1);
        requestUpdate();
    }

    function reset() {
        //counters[selected_counter_num] =0;
        setCounterAtStorage(selected_counter_num, 0);
        requestUpdate();
    }

    // change counter color when select is pushed
    function change_counter() {
        selected_counter_num = (selected_counter_num+1)%3;
        Storage.setValue("selected_counter_num", selected_counter_num);
        requestUpdate();
    }

    // Set counter at persistant storage
    function setCounterAtStorage(_selected_counter_num, value){
        Storage.setValue("counter"+_selected_counter_num, value);
    }

    // Get a string with the storage value
    private function getCounterFromStorage(_selected_counter_num) as Number {
        var value = Storage.getValue("counter"+_selected_counter_num);
        if (value == null) {
            value = 0;
        }
        return value;
    }

    // Get a string with the storage value
    private function getSelected_counter_numFromStorage() as Number {
        var value = Storage.getValue("selected_counter_num");
        if (value == null) {
            value = 0;
        }
        return value;
    }

      /*  public function onReceive(args as Dictionary or String or Null) as Void {
        if (args instanceof String) {
           System.println("response as String = "+args);
        } else if (args instanceof Dictionary) {
            System.println(args["count1"]);
            System.println(args["count2"]);
        }
    }  */
}
