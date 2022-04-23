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
    func presentDailyWeather()
}

class DailyWeatherViewController: UIViewController, DailyViewDataProtocol {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    var dailyPresenter : DailyWeatherPresenterDelegate?
    var cityName: String? = "Cairo"
    let locationManager = CLLocationManager()
    var weatherData: WeatherData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        dailyPresenter = DailyWeatherPresenter(delegate: self)
        
        //Need to save city in UserDefaults in AppDelegate and fetch it here, becuase this is not working for now
        dailyPresenter?.getDailyWeather(for: UserDefaults.standard.string(forKey: "CurrentWeather") ?? "Cairo")
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }

    @IBAction func fetchButtonPressed(_ sender: UIButton) {
        guard let cityName = cityTextField.text else { return }
        dailyPresenter?.getDailyWeather(for: cityName)
    }
    
    @objc func getMyLocation() {
        
    }
    
    //MARK: ViewProtocol Functions
    func presentDailyWeather() {
        cityTextField.text = cityName ?? "No city detected."
        guard let image = dailyPresenter?.weatherImage(status: weatherData?.weather[0].main ?? "sun") else { return }
        weatherImage.image = UIImage(systemName: image)
        degreeLabel.text = "\(weatherData?.main.temp ?? 0)"
    }
}


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

