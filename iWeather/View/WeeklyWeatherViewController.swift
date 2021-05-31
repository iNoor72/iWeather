//
//  WeeklyWeatherViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import CoreLocation

protocol WeeklyViewDataProtocol: AnyObject {
    var weatherData: WeeklyWeatherData? {get set}
    func presentWeeklyWeather()
}

class WeeklyWeatherViewController: UIViewController, WeeklyViewDataProtocol {
    @IBOutlet weak var citySearchBar: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var weeklyPresenter : WeeklyWeatherPresenterDelegate?
    var weatherData: WeeklyWeatherData?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyPresenter = WeeklyPresenter(weeklyView: self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCell")
        
        //Need to save city in UserDefaults in AppDelegate and fetch it here, becuase this is not working for now
        weeklyPresenter?.getWeeklyWeather(for: UserDefaults.standard.string(forKey: "CurrentWeather") ?? "Cairo")
        presentWeeklyWeather()
    }
    
    
    func presentWeeklyWeather() {
        
    }
    
}

//MARK:- CoreLocation Extension Functions

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

//MARK:- CollectionView Extension Functions

extension WeeklyWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData?.list.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        return cell
    }
    
    
}
