//
//  WeeklyWeatherViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit

class WeeklyWeatherViewController: UIViewController, WeatherPresenterDelegate {

    let weeklyPresenter = Presenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyPresenter.delegate = self
    }
    
    func getDailyWeather() {
        
    }
    
    func getWeeklyWeather() {
        
    }
    
    //Will be deleted later and put into the Presenter instead
    func fetchWeather(cityName: String) {
        let url = ("\(Router.todayWeather)"+"q=\(cityName)")
    }

}
