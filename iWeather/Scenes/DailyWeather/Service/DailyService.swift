//
//  DailyService.swift
//  iWeather
//
//  Created by Noor Walid on 24/04/2022.
//

import Foundation

class DailyService {
    private let network: NetworkServices
    
    init(network: NetworkServices) {
        self.network = network
    }
    
    func fetchDailyWeatherData(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        DailyRepository(network: network).fetchDailyWeatherData(for: city, completion: completion)
    }
}
