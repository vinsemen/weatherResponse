//
//  Service.swift
//  HomeWork#4
//
//  Created by Семён Винников on 11.12.2022.
//

import Foundation
import Alamofire


class Service {
    
    func sendWeatherRequest(completion: @escaping (Weather) -> ()) {
        
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=3951e1df993d0bde66bfd4c10bbfeedf"
        
        AF.request(url, method: .get).responseData { responce in
            guard let data = responce.data else { return }
            let weather = try! JSONDecoder().decode(WeatherResponce.self, from: data)
            
            completion(weather.current)
        }
    }
    
    
}

