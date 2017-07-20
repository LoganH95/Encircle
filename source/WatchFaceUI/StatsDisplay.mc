using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
using Toybox.ActivityMonitor;

class StatsDisplay {

	static function drawDate(dc, x, y, font, justification) {
		var date = Calendar.info(Time.now(), Time.FORMAT_MEDIUM);
		var dateFormat = App.getApp().getProperty("dateFormat");
		var dateString; 
		if (!dateFormat) {
			dateString = Lang.format("$1$ $2$ $3$" , [date.day_of_week, date.month, date.day]);
		  	if (date.day_of_week.equals("Thurs") || date.day_of_week.equals("Thur")) {
				dateString = Lang.format("$1$ $2$ $3$" , ["Thu", date.month, date.day]);
			}
		}
		else {
			dateString = Lang.format("$1$ $2$ $3$" , [date.day_of_week, date.day, date.month]);
		  	if (date.day_of_week.equals("Thurs") || date.day_of_week.equals("Thur")) {
				dateString = Lang.format("$1$ $2$ $3$" , ["Thu", date.day, date.month]);
			}
		}
		dc.drawText(x, y, font, dateString, justification);
	}
	
	static function drawSteps(dc, x, y, font, justification) {
		var stepString = Lang.format("$1$", [ActivityMonitor.getInfo().steps]);
		dc.drawText(x, y, font, stepString, justification);
	}
	
	static function drawGoal(dc, x, y, font, justification) {
		var goalString = Lang.format("$1$", [ActivityMonitor.getInfo().stepGoal]);
		dc.drawText(x, y, font, goalString, justification);
	}
	
	static function drawDistance(dc, x, y, font, justification) {
		var distanceString; 
		if (!Sys.getDeviceSettings().distanceUnits) {
			var distance = ActivityMonitor.getInfo().distance.toDouble() / 100000.toFloat(); 
			distanceString = Lang.format("$1$ k", [distance.format("%.1f")]);
		}
		else {
			var distance = ActivityMonitor.getInfo().distance.toDouble() * .0000062137119.toFloat();
			distanceString = Lang.format("$1$ m", [distance.format("%.1f")]);
		}
		dc.drawText(x, y, font, distanceString, justification);
	}
	
	static function drawCalories(dc, x, y, font, justification) {
		var calorieString = Lang.format("$1$ C" , [ActivityMonitor.getInfo().calories]);
		dc.drawText(x, y, font, calorieString, justification);
	}
}