//
//  WeatherData.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import Foundation


struct WeatherData: Codable {
    let weather: [Weather]
    let name: String
    let main: WeatherTemp
    
}

struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

struct WeatherTemp: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
