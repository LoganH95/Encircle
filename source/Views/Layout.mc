using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;

class Layout {

	hidden var width, height; 
	hidden var stats; 
	
	enum { 
		steps_type,
		calories_type,
		goal_type,
		distance_type
	}
	
	function initialize() {
		stats = new StatsDisplay(); 
	}
    
    function displayInfo(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	var layout = App.getApp().getProperty("layout");
    	var inverter = App.getApp().getProperty("id_invert");
    	dc.setColor(Color.getPrimaryColor() , Gfx.COLOR_TRANSPARENT);
    	corners(dc, inverter); 
    }
    
    hidden function corners(dc, inverter) {
    	cornerIcons(dc, inverter); 
    	
		StatsDisplay.drawDate(dc, width/2, 3 * height/4 - 10, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_CENTER); 
		bottomCorner(dc, true, App.getApp().getProperty("left_prop"));
		bottomCorner(dc, false, App.getApp().getProperty("right_prop"));
    }
    
    hidden function cornerIcons(dc, inverter) {
    	var symbol = new Symbol();
    	symbol.drawBluetooth(dc, width/2 - 50, height/2 - 7, inverter);
       	symbol.drawNotification(dc, width/2 + 32, height/2 - 9, inverter);
        symbol.drawBattery(dc, width);
	}
	
	hidden function bottomCorner(dc, left, cornerSwitch) {
    	var justification, x; 
    	if (left) {
    		x = 0; 
    		justification = Gfx.TEXT_JUSTIFY_LEFT; 
		} else {
			x = width - 1; 
			justification = Gfx.TEXT_JUSTIFY_RIGHT; 
		}
    	if (cornerSwitch == steps_type) {
    		StatsDisplay.drawSteps(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		} else if (cornerSwitch == calories_type) {
			StatsDisplay.drawCalories(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		} else if (cornerSwitch == goal_type) {
			StatsDisplay.drawGoal(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		}  else if (cornerSwitch == distance_type) {
			StatsDisplay.drawDistance(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		}
    }
}