public class WeatherForecast_Controller
{
	@AuraEnabled
    public static Map<String,Object> getWeatherData(String city)
    {
        String requestEndpoint = 'http://api.weatherapi.com/v1/forecast.json?key=';
        requestEndpoint += '2ce8694dad7c4ccf838130557210701';
        requestEndpoint += '&q=' + city;
        requestEndpoint += '&days=3';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        Map<String,Object> results = new Map<String,Object>();
        
        if (response.getStatusCode() == 200) 
        {
            results = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        }
        
        //system.debug('results: '+results);
        return results;
    }
}