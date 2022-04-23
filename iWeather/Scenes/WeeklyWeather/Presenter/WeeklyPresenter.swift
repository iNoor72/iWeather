//
//  WeeklyPresenter.swift
//  iWeather
//
//  Created by Noor Walid on 31/05/2021.
//

import Foundation
import CoreLocation
import Alamofire

protocol WeeklyWeatherPresenterDelegate {
    func getWeeklyWeather(for city: String)
    func getWeeklyWeather(longitude : CLLocationDegrees, latitude: CLLocationDegrees)
    func presentWeather()
}



class WeeklyPresenter: WeeklyWeatherPresenterDelegate {
    
    weak var weeklyView: WeeklyViewDataProtocol?
    
    init(weeklyView: WeeklyViewDataProtocol) {
        self.weeklyView = weeklyView
    }
    
    func getWeeklyWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) {
        
    }
    
    func getWeeklyWeather(for city: String){
        let url = WeeklyWeatherAlamofireEndpoints.weeklyWeather(city: city)
        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeeklyWeatherData, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                self?.weeklyView?.weatherData = data
                self?.weeklyView?.presentWeeklyWeather()
                
            case .failure(let error):
                print("There was a problem fetching weekly data. \(error.localizedDescription)")
            }
        }
        
    }
    
    func presentWeather() {
        weeklyView?.presentWeeklyWeather()
    }
    
    
    
    
}
