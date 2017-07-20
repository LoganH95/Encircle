using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class TimeDisplay {

	hidden var width;
	hidden var height;
	
    function displayTime(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
	   	
    	drawHours(dc);
    	drawMinute(dc);
    }
    
    hidden function drawHours(dc) {
    	var originX = width/2;
    	var originY = height/2;
    	var hour = Sys.getClockTime().hour;
    	
    	if (hour > 12) {
    		hour -= 12;
    	} else if (hour == 0) {
    		hour = 12;
    	}
    	
    	var adjust = Sys.getDeviceSettings().partNumber.equals("006-B1765-00") ? 4 : 0;
    	
    	dc.setColor(hourColor(hour, 12), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX, originY - 80 + adjust, Gfx.FONT_LARGE, 12, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 1), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX + 29, originY - 73, Gfx.FONT_LARGE, 1, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 2), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX + 53, originY - 51, Gfx.FONT_LARGE, 2, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 3), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX + 60, originY - 15, Gfx.FONT_LARGE, 3, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 4), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX + 53, originY + 19, Gfx.FONT_LARGE, 4, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 5), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX + 29, originY + 41, Gfx.FONT_LARGE, 5, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 6), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX, originY + 47, Gfx.FONT_LARGE, 6, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 7), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX - 29, originY + 41, Gfx.FONT_LARGE, 7, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 8), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX - 53, originY + 19, Gfx.FONT_LARGE, 8, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 9), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX - 60, originY - 15, Gfx.FONT_LARGE, 9, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 10), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX - 58, originY - 51, Gfx.FONT_LARGE, 10, Gfx.TEXT_JUSTIFY_CENTER);
    	
    	dc.setColor(hourColor(hour, 11), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(originX - 30, originY - 73, Gfx.FONT_LARGE, 11, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    hidden function hourColor(hour, checkHour) {
    	return hour == checkHour ? Color.getPrimaryColor() : Color.getTertiaryColor();
    }
    
    hidden function drawMinute(dc) {
    	var minute = Lang.format("$1$", [Sys.getClockTime().min.format("%02d")]);
    	dc.setColor(Color.getSecondaryColor(), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(width/2, height/4, Gfx.FONT_NUMBER_THAI_HOT, minute, Gfx.TEXT_JUSTIFY_CENTER);
    }
}