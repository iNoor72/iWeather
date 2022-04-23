//
//  ViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import Alamofire
import CoreLocation

class DailyWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    var cityName: String? = "Cairo"
    let locationManager = CLLocationManager()
    
    lazy var dailyViewModel: DailyViewModel = {
        //Create router for it, this is bad because View knows about Service data.
       DailyViewModel(service: DailyService(network: AlamofireNetworkManager()))
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        dailyViewModel.fetchWeatherData()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    @IBAction func fetchButtonPressed(_ sender: UIButton) {
        guard let cityName = cityTextField.text else { return }
        dailyViewModel.cityName = cityName
        dailyViewModel.fetchWeatherData()
    }
    
    @objc func getMyLocation() {
        
    }
    
    //MARK: ViewProtocol Functions
    func presentDailyWeather() {
        cityTextField.text = cityName ?? "No city detected."
        guard let image = dailyPresenter?.weatherImage(status: dailyViewModel.weatherData?.weather[0].main ?? "sun") else { return }
        weatherImage.image = UIImage(systemName: image)
        degreeLabel.text = "\(dailyViewModel.weatherData?.temperatureData.temp ?? 0)"
    }
}


//MARK: CoreLocation Functions

extension DailyWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let detectedCityName = locations.last{
            locationManager.stopUpdatingLocation()
            print(detectedCityName.coordinate.longitude)
            print(detectedCityName.coordinate.latitude)
            dailyViewModel?.getDailyWeather(longitude: detectedCityName.coordinate.longitude, latitude: detectedCityName.coordinate.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error happened while getting location. Error: \(error.localizedDescription)")
    }
}

