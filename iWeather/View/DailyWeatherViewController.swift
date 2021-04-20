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
        //Do some functions to detect my location
        //Login goes here
        
        locationManager(self.locationManager, didUpdateLocations: [CLLocation]())
    }
    
    func presentDailyWeather() {
        
    }
    
    //Will be deleted later and put into the Presenter instead
    func fetchWeather(cityName: String) {
        let url = ("\(Router.todayWeather)"+"q=\(cityName)")
    }
}

extension DailyWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let detectedCityName = ""
        cityName = detectedCityName
        dailyPresenter.getDailyWeather(for: "")
    }
}

