//
//  DailyWeatherViewController+Extensions.swift
//  iWeather
//
//  Created by Noor Walid on 05/12/2021.
//

import UIKit
import CoreLocation
import CoreLocationUI


//MARK: CoreLocation Functions

extension DailyWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let detectedCityName = locations.last{
            locationManager.stopUpdatingLocation()
            print(detectedCityName.coordinate.longitude)
            print(detectedCityName.coordinate.latitude)
            dailyPresenter?.getDailyWeather(longitude: detectedCityName.coordinate.longitude, latitude: detectedCityName.coordinate.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error happened while getting location. Error: \(error.localizedDescription)")
    }
}


