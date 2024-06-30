//
//  WeatherManager.swift
//  Clima
//
//  Created by sohail shaik on 6/29/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
}

struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=d485d1f2b1e483afffb8006b3bc907f6&units=metric"
    
    func fetchWeather(city: String){
        let cityUrl = "\(url)&q=\(city)"
        performRequest(cityUrl)
    }
    func fetchWeather(lat: CLLocationDegrees,lon:CLLocationDegrees){
        let latLonUrl = "\(url)&lat=\(lat)&lon=\(lon)"
        performRequest(latLonUrl)
    }
    
    var delegate:WeatherManagerDelegate?
    func performRequest(_ cityUrl: String){
        if let url = URL(string: cityUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let weatherData = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(weatherData)
                    }
                    
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ data: Data)-> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let conditionId = decodedData.weather[0].id
            let name = decodedData.name
            let temperature = decodedData.main.temp
            let weatherModel = WeatherModel(conditionIdid: conditionId, temp: temperature, name: name,description: decodedData.weather[0].description)
            return weatherModel
        }
        catch{
            print(error)
            return nil
        }
    }
}
