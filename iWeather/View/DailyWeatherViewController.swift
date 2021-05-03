//
//  ViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import Alamofire
import CoreLocation

protocol DailyViewDataProtocol: AnyObject {
    var weatherData: WeatherData? {get set}
    func fetchWeather(cityName: String)
    func presentDailyWeather()
}

class DailyWeatherViewController: UIViewController, DailyViewDataProtocol {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    
    var dailyPresenter : DailyWeatherPresenterDelegate?
    var cityName: String?
    let locationManager = CLLocationManager()
    var weatherData: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        dailyPresenter = DailyWeatherPresenter(delegate: self)
        
        //Get weather for the saved city from UserDefaults for example
        dailyPresenter?.getDailyWeather(for: "")
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }

    @IBAction func detectMyLocationTapped(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    //MARK:- ViewProtocol Functions
    
    func presentDailyWeather() {
        cityTextField.text = cityName ?? "No city detected."
        weatherImage.image = UIImage(systemName: "\(weatherData?.weather[0].weatherDescription)")
    }
    
    //Will be deleted later and put into the Presenter instead
    func fetchWeather(cityName: String) {
        dailyPresenter?.getDailyWeather(for: cityName)
        let url = ("\(Router.todayWeather)"+"q=\(cityName)")
        
    }
}

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

