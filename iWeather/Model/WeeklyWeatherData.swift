//
//  WeeklyWeatherData.swift
//  iWeather
//
//  Created by Noor Walid on 31/05/2021.
//

import Foundation

struct WeeklyWeatherData: Codable {
    var list : [WeatherElements]
    var date : String
    
    enum CodingKeys: String, CodingKey {
        case list
        case date = "dt_txt"
    }
}

struct WeatherElements: Codable {
    var main: TemperatureData
    var weather: [Info]
    
}


//Needs to be refined

struct Info: Codable {
    var main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}
