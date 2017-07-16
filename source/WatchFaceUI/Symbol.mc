using Toybox.System as Sys;
using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class Symbol {
	hidden var bluetooth, invertedBluetooth, notifications, invertedNotifications;
	
	function initialize() {
		bluetooth = Ui.loadResource(Rez.Drawables.bluetooth_ID);
        invertedBluetooth = Ui.loadResource(Rez.Drawables.invertedBluetooth_ID);
        notifications = Ui.loadResource(Rez.Drawables.notifications_ID);
        invertedNotifications = Ui.loadResource(Rez.Drawables.invertedNotifications_ID);
	}
	
	function drawBluetooth(dc, x, y, inverter) {
		if (Sys.getDeviceSettings().phoneConnected && !inverter) {
			dc.drawBitmap(x, y, bluetooth);
		} else if (Sys.getDeviceSettings().phoneConnected && inverter) {
			dc.drawBitmap(x + 2, y + 1, invertedBluetooth);
		}
	}
	
	function drawNotification(dc, x, y, inverter) {
		if (Sys.getDeviceSettings().notificationCount >= 1 && !inverter) {
			dc.drawBitmap(x, y, notifications);
		} else if (Sys.getDeviceSettings().notificationCount >= 1 && inverter) {
			dc.drawBitmap(x, y + 4, invertedNotifications);
		}
	}
	
	function drawBattery(dc, width) {
    	dc.drawRectangle(width/2 - 8, 25, 16, 10);
    	dc.fillRectangle(width/2 + 8, 27, 3, 6);
    	
    	var percent = Sys.getSystemStats().battery.toNumber().toDouble()/100.toDouble();
    	if (percent <= .2) {
    		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
    	}
    	
    	dc.fillRectangle(width/2 - 6, 27, 12 * percent, 6);
    	
    	if (percent < .1 && percent > .03) {
    		dc.fillRectangle(width/2 - 6, 27, 1, 6);
    	}
    }
}