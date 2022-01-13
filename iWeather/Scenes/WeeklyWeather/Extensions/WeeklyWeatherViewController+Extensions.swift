//
//  WeeklyWeatherViewController+Extensions.swift
//  iWeather
//
//  Created by Noor Walid on 05/12/2021.
//

import UIKit
import CoreLocation
import CoreLocationUI

//MARK: CollectionView Extension Functions

extension WeeklyWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData?.list.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.weatherCellID, for: indexPath) as! WeatherCollectionViewCell
        
        return cell
    }
    
    
}


//MARK: CoreLocation Extension Functions

extension WeeklyWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let detectedCityName = locations.last{
            locationManager.stopUpdatingLocation()
            print(detectedCityName.coordinate.longitude)
            print(detectedCityName.coordinate.latitude)
            weeklyPresenter?.getWeeklyWeather(longitude: detectedCityName.coordinate.longitude, latitude: detectedCityName.coordinate.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error happened while getting location. Error: \(error.localizedDescription)")
    }
}

