//
//  Presenter.swift
//  iWeather
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation
import UIKit
import Alamofire

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
    
    func getDailyWeather(for city: String){
        let url = Router.todayWeather
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
