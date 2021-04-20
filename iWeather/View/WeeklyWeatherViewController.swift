//
//  WeeklyWeatherViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit

class WeeklyWeatherViewController: UIViewController, WeeklyWeatherPresenterDelegate {

    let weeklyPresenter = WeeklyWeatherPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyPresenter.weeklyDelegate = self
        weeklyPresenter.getWeeklyWeather(for: "")
    }
    
    func presentWeeklyWeather() {
        
    }
    
    //Will be deleted later and put into the Presenter instead
    func fetchWeather(cityName: String) {
        let url = ("\(Router.weeklyWeather)"+"q=\(cityName)")
    }

}
