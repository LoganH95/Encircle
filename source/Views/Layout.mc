using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class Layout {
	hidden var width, height; 
	hidden var stats = new StatsDisplay(); 
	
	enum { 
		steps_type,
		calories_type,
		goal_type,
		distance_type
	}

	function initialize() {
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
    	
		stats.drawDate(dc, width/2, 3 * height/4 - 10, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_CENTER); 
		
		if (Sys.getDeviceSettings().partNumber.equals("006-B1765-00")) {
   			//stats.drawBattery(dc, 203, 1, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
 		} else { 
 			//stats.drawBattery(dc, 203, -3, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
 		}
 		
		//bottomCorner(dc, true, App.getApp().getProperty("left_prop"));
		//bottomCorner(dc, false, App.getApp().getProperty("right_prop"));
    }
    
    hidden function cornerIcons(dc, inverter) {
    	var symbol = new Symbol();
    	symbol.drawBluetooth(dc, width/2 - 50, height/2 - 7, inverter);
       	symbol.drawNotification(dc, width/2 + 32, height/2 - 9, inverter);
       	//symbol.drawBluetooth(dc, -2, 0, inverter);
       	//dc.drawText(originX - 60, originY - 15, Gfx.FONT_LARGE, 9, Gfx.TEXT_JUSTIFY_CENTER);
       	
       //	dc.drawText(originX + 60, originY - 15, Gfx.FONT_LARGE, 3, Gfx.TEXT_JUSTIFY_CENTER);
       symbol.drawBattery(dc, width);
       	//symbol.drawNotification(dc, 9, -2, inverter);
	}
	
	hidden function bottomCorner(dc, left, cornerSwitch) {
    	var justification, x; 
    	if (left) {
    		x = 0; 
    		justification = Gfx.TEXT_JUSTIFY_LEFT; 
		}
		else {
			x = width - 1; 
			justification = Gfx.TEXT_JUSTIFY_RIGHT; 
		}
    	if (cornerSwitch == steps_type) {
    		stats.drawSteps(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		} else if (cornerSwitch == calories_type) {
			stats.drawCalories(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		} else if (cornerSwitch == goal_type) {
			stats.drawGoal(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		}  else if (cornerSwitch == distance_type) {
			stats.drawDistance(dc, x, 125, Gfx.FONT_MEDIUM, justification);
		}
    }
}