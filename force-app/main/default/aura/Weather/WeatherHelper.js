({
    getWeather : function(component,helper) 
    {
        var action = component.get('c.getWeatherData');
        action.setParams({ city : component.get('v.city') });
        
        action.setCallback(this, function(res)
                           {
                               component.set('v.weatherData', res.getReturnValue());
                               console.log(res.getReturnValue());
                               
                               component.set('v.firstDay',res.getReturnValue().forecast.forecastday[0]);
                               component.set('v.secondDay',res.getReturnValue().forecast.forecastday[1]);
                               component.set('v.thirdDay',res.getReturnValue().forecast.forecastday[2]);
                           });
        $A.enqueueAction(action);
    },
    
})