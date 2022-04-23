//
//  DailyViewModel.swift
//  iWeather
//
//  Created by Noor Walid on 23/04/2022.
//

import Foundation
import CoreLocation

class DailyViewModel {
    private let service: DailyService
    
    var lat: CLLocationDegrees?
    var long: CLLocationDegrees?
    var cityName: String?
    var weatherData: WeatherResponse?
    
    init(service: DailyService) {
        self.service = service
    }
    
    func fetchWeatherData() {
        guard let cityName = cityName else {
            return
        }

        service.fetchDailyWeatherData(for: cityName) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let response):
                self.weatherData = response
            }
        }
    }
}
