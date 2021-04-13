//
//  ViewController.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import UIKit
import Alamofire

class DailyWeatherViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func detectMyLocationTapped(_ sender: UIButton) {
        //Do some functions to detect my location
    }
    
    func fetchWeather(cityName: String) {
        let url = ("\(Router.todayWeather) + q=\(cityName)")
    }
}

