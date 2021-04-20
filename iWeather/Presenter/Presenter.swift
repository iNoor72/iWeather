//
//  Presenter.swift
//  iWeather
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation
import UIKit
import Alamofire
import CoreLocation

protocol DailyWeatherPresenterDelegate {
    func presentDailyWeather()
}

protocol WeeklyWeatherPresenterDelegate {
    func presentWeeklyWeather()
}

typealias DailyPresenteDelegate = UIViewController & DailyWeatherPresenterDelegate
typealias WeeklyPresenterDelegate = UIViewController & WeeklyWeatherPresenterDelegate

class DailyWeatherPresenter {
    weak var dailyDelegate: DailyPresenteDelegate?
    
    //Check the calling url
    
    func getDailyWeather(for city: String){
        let url = Router.todayWeather.path + "q=\(city)"
        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeatherData, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                self?.dailyDelegate?.presentDailyWeather()
                
            case .failure(let error):
                print("There was a problem fetching data. \(error.localizedDescription)")
            }
        }
    }
    
    func getDailyWeather(longitude : CLLocationDegrees, latitude: CLLocationDegrees) {
        let url = Router.todayWeather.path + "lat=\(longitude)" + "&long\(latitude)"
        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeatherData, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                self?.dailyDelegate?.presentDailyWeather()
                
            case .failure(let error):
                print("There was a problem fetching data. \(error.localizedDescription)")
            }
        }
    }
    
}

class WeeklyWeatherPresenter {
    weak var weeklyDelegate: WeeklyPresenterDelegate?
    
    func getWeeklyWeather(for city: String){
        let url = Router.weeklyWeather
        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeatherData, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                self?.weeklyDelegate?.presentWeeklyWeather()
                
            case .failure(let error):
                print("There was a problem fetching data. \(error.localizedDescription)")
            }
        }
        
    }
}
