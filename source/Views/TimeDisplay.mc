using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class TimeDisplay {
	var width; 
	var height;

	function initialize() { 
    }
	
    function displayTime(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
	   	
    	drawHours(dc);   
    	drawMinute(dc); 
    }
    
    
    function drawHours(dc) {
    	var originX = width/2; 
    	var originY = height/2; 
    	var hour = Sys.getClockTime().hour; 
    	
    	if (hour > 12) {
    		hour -= 12; 
    	} else if (hour == 0) {
    		hour = 12; 
    	}
    	
    	var adjust = 0; 
    	
    	if (Sys.getDeviceSettings().partNumber.equals("006-B1765-00")) {
    		adjust = 4; 
 		}
    	
    	checkHour(dc, hour, 12); 
    	dc.drawText(originX, originY - 80 + adjust, Gfx.FONT_LARGE, 12, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 1); 
    	dc.drawText(originX + 29, originY - 73, Gfx.FONT_LARGE, 1, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 2);
    	dc.drawText(originX + 53, originY - 51, Gfx.FONT_LARGE, 2, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 3);
    	dc.drawText(originX + 60, originY - 15, Gfx.FONT_LARGE, 3, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 4);
    	dc.drawText(originX + 53, originY + 19, Gfx.FONT_LARGE, 4, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 5);
    	dc.drawText(originX + 29, originY + 41, Gfx.FONT_LARGE, 5, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 6);
    	dc.drawText(originX, originY + 47, Gfx.FONT_LARGE, 6, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 7);
    	dc.drawText(originX - 29, originY + 41, Gfx.FONT_LARGE, 7, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 8);
    	dc.drawText(originX - 53, originY + 19, Gfx.FONT_LARGE, 8, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 9);
    	dc.drawText(originX - 60, originY - 15, Gfx.FONT_LARGE, 9, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 10);
    	dc.drawText(originX - 58, originY - 51, Gfx.FONT_LARGE, 10, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	checkHour(dc, hour, 11);
    	dc.drawText(originX - 30, originY - 73, Gfx.FONT_LARGE, 11, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    function checkHour(dc, hour, checkHour) {
    	if (hour == checkHour) {
    		dc.setColor(Color.getPrimaryColor(), Gfx.COLOR_TRANSPARENT);
    	} else {
    		dc.setColor(Color.getTertiaryColor(), Gfx.COLOR_TRANSPARENT);
    	}
    }
    
    function drawMinute(dc) {
    	var minute = Lang.format("$1$", [Sys.getClockTime().min.format("%02d")]); 
    	dc.setColor(Color.getSecondaryColor(), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(width/2, height/4, Gfx.FONT_NUMBER_THAI_HOT, minute, Gfx.TEXT_JUSTIFY_CENTER);
    }
}