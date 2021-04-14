//
//  Presenter.swift
//  iWeather
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation
import UIKit
import Alamofire

protocol WeatherPresenterDelegate {
    func getDailyWeather()
    func getWeeklyWeather()
}

typealias PresenterDelegate = UIViewController & WeatherPresenterDelegate
class Presenter {
    weak var delegate: PresenterDelegate?
    
    func getWeather(for city: String){
        let url = Router.todayWeather
        AF.request(url).responseDecodable {[weak self](response: (DataResponse<WeatherData, AFError>)) in
            switch response.result {
            case .success(let data):
                print("Data succesfully fetched. \(data)")
                
            case .failure(let error):
                print("There was a problem fetching data. \(error.localizedDescription)")
            }
        }
    }
    
    func getWeeklyWeather(for city: String){}
    
    
}
