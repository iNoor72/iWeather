//
//  DailyWeatherEndpoints.swift
//  iWeather
//
//  Created by Noor Walid on 23/04/2022.
//

import Foundation
import Alamofire

enum DailyWeatherAlamofireEndpoints {
    case todayWeather(city: String)
}

extension DailyWeatherAlamofireEndpoints: AlamofireEndpoint {
    
    var path: String {
        switch self {
        case .todayWeather(_):
            return "/weather"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .todayWeather(_):
            return .get
        }
    }
    
    
    var parameters: Parameters? {
        switch self {
        case .todayWeather(let city):
            return ["appid": Constants.API_Key,
                    "q": city
            ]
        }
    }
}
