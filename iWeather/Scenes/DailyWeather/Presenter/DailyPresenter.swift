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
    func getDailyWeather(for city: String)
    func getDailyWeather(longitude : CLLocationDegrees, latitude: CLLocationDegrees)
    func weatherImage(status: String) -> String
}
class DailyWeatherPresenter: DailyWeatherPresenterDelegate {
    
    weak var dailyView: DailyViewDataProtocol?
    
    init(delegate: DailyViewDataProtocol) {
        self.dailyView = delegate
    }
    
    func getDailyWeather(for city: String){
        let url = DailyWeatherAlamofireEndpoints.todayWeather(city: city)
        AF.request(url).responseDecodable {[weak self] (response: (DataResponse<WeatherResponse, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                
                self?.dailyView?.weatherData = data
                self?.dailyView?.presentDailyWeather()
                
                
            case .failure(let error):
                print("There was a problem fetching data. \(error.localizedDescription)")
            }
        }
    }
    
    func weatherImage(status: String) -> String {
        switch status {
        case "clear":
            return "sun.min.fill"
        case "rain":
            return "cloud.rain.fill"
        case "cloudy":
            return "cloud.fill"
        default:
            return "sun.min.fill"
        }
    }
    
    func getDailyWeather(longitude : CLLocationDegrees, latitude: CLLocationDegrees) {
        // Get url for lan & lat
//        let url = Router.todayWeather.path + "lat=\(longitude)" + "&long\(latitude)"
//        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeatherData, AFError>)) in
//            switch response.result {
//            case .success(let data):
//                print("Data succesfully fetched. \(data)")
//                self?.dailyView?.weatherData = data
//                self?.dailyView?.presentDailyWeather()
//
//            case .failure(let error):
//                print("There was a problem fetching data. \(error.localizedDescription)")
//            }
//        }
    }
    
}
