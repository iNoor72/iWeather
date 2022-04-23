//
//  WeatherData.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import Foundation


struct WeatherResponse: Codable {
    var weather: [WeatherData]
    var name: String
    var temperatureData: TemperatureData
    
    enum CodingKeys: String, CodingKey {
        case weather, name
        case temperatureData = "main"
    }
}

struct WeatherData: Codable {
    var id: Int
    var main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

struct TemperatureData: Codable {
    var temp, feelsLike, tempMin, tempMax: Double
    var pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
