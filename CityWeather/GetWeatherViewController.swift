//
//  GetWeatherViewController.swift
//  CityWeather
//
//  Created by Md Zahidul Islam Mazumder on 24/8/19.
//  Copyright © 2019 Md Zahidul Islam Mazumder. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class GetWeatherViewController: UIViewController {

    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var Des: UILabel!
    
    @IBOutlet weak var maxTemp: UILabel!
    
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var minTemp: UILabel!
    
    @IBOutlet weak var rise: UILabel!
    
    @IBOutlet weak var set: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Present Weather"
        place.text = city
        
        let header:HTTPHeaders = [
        
            "x-rapidapi-host" : "community-open-weather-map.p.rapidapi.com",
            "X-RapidAPI-Key" : "6a2b9ff5a9msh9dfb8ca364e93dep1ac43fjsn7d2d459bb92c"
        
        ]
        Alamofire.request("https://community-open-weather-map.p.rapidapi.com/weather?q=\(city)", method: .get,encoding: JSONEncoding.default, headers:header)
            .responseJSON { response in
                
                if response.result.isSuccess  {
                    let json = JSON(response.result.value!)
                    
                    
                    
                    if let weather = json["weather"].array {
                        for i in weather {
                            if let type = i["description"].string {
                                // get type
                                self.Des.text? = type.capitalized
                            }

                            
                        }
                    }
                    
                    self.temp.text? = "Temperature: " + String(json["main"]["temp"].intValue - Int( 274.15)) + "°C"
                    self.maxTemp.text? = "Max Temp: " + String(json["main"]["temp_max"].intValue - Int( 274.15)) + "°C"
                    self.minTemp.text? = "Min Temp: " + String(json["main"]["temp_min"].intValue - Int( 274.15)) + "°C"
                    self.rise.text? = "Humidity: " + json["main"]["humidity"].stringValue
                    self.set.text? = "Pressure: " + json["main"]["pressure"].stringValue
                    
                    //print(w["description"])
                }
                    
                else{
                    print(Error.self)
                }
                    
                
        }
    }
    

    

}
