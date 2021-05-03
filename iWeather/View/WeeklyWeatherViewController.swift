//
//  WeeklyWeatherViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import CoreLocation

protocol WeeklyViewDataProtocol: AnyObject {
    var weatherData: WeatherData? {get set}
    //func fetchWeather(cityName: String)
    func presentWeeklyWeather()
}

class WeeklyWeatherViewController: UIViewController, WeeklyViewDataProtocol {
    var weeklyPresenter : WeeklyWeatherPresenterDelegate?
    var weatherData: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyPresenter = WeeklyWeatherPresenter(weeklyDelegate: self)
        weeklyPresenter?.getWeeklyWeather(for: "Cairo")
    }
    
    func presentWeeklyWeather() {
        
    }
}
