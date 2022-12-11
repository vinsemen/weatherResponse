//
//  ViewController.swift
//  HomeWork#4
//
//  Created by Семён Винников on 10.12.2022.
//

import UIKit


class ViewController: UIViewController {
    
    var weather = Weather()
    let service = Service()
    
    
    @IBOutlet var textTemp: UILabel!
    @IBOutlet var textDate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.sendWeatherRequest { weather in
            self.weather = weather
//            print("temp = \(NSString(format:"%.2f", weather.temp))")
//            print("date = \(weather.date)")
            self.textTemp.text = String(NSString(format:"%.2f", weather.temp))
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zone"
            self.textDate.text = dateFormatter.string(from: weather.date)
        }
    }


}

