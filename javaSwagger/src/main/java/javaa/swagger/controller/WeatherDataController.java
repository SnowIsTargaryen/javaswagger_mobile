package javaa.swagger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WeatherDataController {
	
	
	@RequestMapping(value="/data/weatherData",method=RequestMethod.GET)
	public void form()
	{
		
	}

}
