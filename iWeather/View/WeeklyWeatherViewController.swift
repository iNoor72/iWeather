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
