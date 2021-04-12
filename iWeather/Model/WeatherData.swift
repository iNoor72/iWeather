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
