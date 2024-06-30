//
//  WeatherModel.swift
//  Clima
//
//  Created by sohail shaik on 6/29/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionIdid: Int
    let temp: Double
    let name: String
    let description: String
    
    var getConditionDescription : String {
        return description.capitalized
    }
    var getTemperature: String{
        return String(format: "%.1f", temp)
    }
    
    var getConditionSymbol: String {
        switch conditionIdid {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
}
