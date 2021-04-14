//
//  ViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import Alamofire

class DailyWeatherViewController: UIViewController, WeatherPresenterDelegate {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    
    let dailyPresenter = Presenter()
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyPresenter.delegate = self
        
        dailyPresenter.getWeather(for: "")
        
    }


    @IBAction func detectMyLocationTapped(_ sender: UIButton) {
        //Do some functions to detect my location
        //Login goes here
        
        let detectedCityName = ""
        cityName = detectedCityName
        dailyPresenter.getWeather(for: cityName ?? "London")
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

