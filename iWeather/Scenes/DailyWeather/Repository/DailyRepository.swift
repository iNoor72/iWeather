//
//  DailyRepository.swift
//  iWeather
//
//  Created by Noor Walid on 24/04/2022.
//

import Foundation
import CoreLocation

class DailyRepository {
    private let network: NetworkServices
    
    init(network: NetworkServices) {
        self.network = network
    }
    
    func fetchDailyWeatherData(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let endpoint = DailyWeatherAlamofireEndpoints.todayWeather(city: city)
        network.send(endpoint: endpoint, expectedType: WeatherResponse.self) { result in
            switch result {
            case .failure(let error):
                print(error)
                completion(.failure(error))
                
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
//    func fetchDailyWeatherData(for lat: CLLocationDegrees, long: CLLocationDegrees, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
//        let endpoint = DailyWeatherAlamofireEndpoints.todayWeather(city: city)
//        network.send(endpoint: endpoint, expectedType: WeatherResponse.self) { result in
//            switch result {
//            case .failure(let error):
//                print(error)
//                completion(.failure(error))
//                
//            case .success(let data):
//                completion(.success(data))
//            }
//        }
//    }
}
