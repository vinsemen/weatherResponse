//
//  Model.swift
//  HomeWork#4
//
//  Created by Семён Винников on 10.12.2022.
//

import Foundation
import Alamofire

class WeatherResponce: Decodable {
    let current: Weather
}

class Weather: Decodable {
    var date = Date()
    var temp = 0.0
    var pressure = 0
    var humidity = 0
    var weatherName = ""
    var weatherIcon = ""
    var windSpeed = 0.0
    var windDegrees = 0
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp
        case pressure
        case humidity
        case weather
        case windSpeed = "wind_speed"
        case windDegrees = "wind_deg"
    }
    
    enum WeatherKeys: String, CodingKey {
        case main
        case icon
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        //date in formatter Timestamp
        let date = try values.decode(Int.self, forKey: .date)
        //convert to Date
        self.date = NSDate(timeIntervalSince1970: TimeInterval(date)) as Date
        
        //temp in the unit of measurement fahrenheit
        let temp = try values.decode(Double.self, forKey: .temp)
        //convert to Celsius
        self.temp = temp - 273.15
        
        self.pressure = try values.decode(Int.self, forKey: .pressure)
        self.humidity = try values.decode(Int.self, forKey: .humidity)
        self.windSpeed = try values.decode(Double.self, forKey: .windSpeed)
        self.windDegrees = try values.decode(Int.self, forKey: .windDegrees)
        
        var weatherValues = try values.nestedUnkeyedContainer(forKey: .weather)
        let firtsValue = try weatherValues.nestedContainer(keyedBy: WeatherKeys.self)
        
        self.weatherName = try firtsValue.decode(String.self, forKey: .main)
        self.weatherIcon = try firtsValue.decode(String.self, forKey: .icon)
        
    }
    
    
    
}

