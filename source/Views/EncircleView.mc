using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class EncircleView extends Ui.WatchFace {

	var timeDisplay = new TimeDisplay(); 
    var layout = new Layout(); 

    function initialize() {
        WatchFace.initialize();
    }

    //! Update the view
    function onUpdate(dc) {
    	resetScreen(dc);
    	timeDisplay.displayTime(dc); 
    	layout.displayInfo(dc); 
    }
    
    function resetScreen(dc) {
    	dc.setColor(Color.getBackgroundColor(), Color.getBackgroundColor());
    	dc.clear();
    	dc.setColor(Color.getPrimaryColor(), Gfx.COLOR_TRANSPARENT);
    }
}
