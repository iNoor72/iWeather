//
//  ViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import Alamofire
import CoreLocation

class DailyWeatherViewController: UIViewController, DailyWeatherPresenterDelegate {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    
    let dailyPresenter = DailyWeatherPresenter()
    var cityName: String?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        dailyPresenter.dailyDelegate = self
        dailyPresenter.getDailyWeather(for: "")
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }

    @IBAction func detectMyLocationTapped(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func presentDailyWeather() {
        cityTextField.text = cityName ?? "No city detected."
        weatherImage.image = UIImage(systemName: "")
    }
    
    //Will be deleted later and put into the Presenter instead
    func fetchWeather(cityName: String) {
        let url = ("\(Router.todayWeather)"+"q=\(cityName)")
        
    }
}

extension DailyWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let detectedCityName = locations.last{
            locationManager.stopUpdatingLocation()
            print(detectedCityName.coordinate.longitude)
            print(detectedCityName.coordinate.latitude)
            dailyPresenter.getDailyWeather(longitude: detectedCityName.coordinate.longitude, latitude: detectedCityName.coordinate.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error happened while getting location. Error: \(error.localizedDescription)")
    }
}

