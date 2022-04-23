//
//  WeeklyWeatherEndpoints.swift
//  iWeather
//
//  Created by Noor Walid on 23/04/2022.
//

import Foundation
import Alamofire

enum WeeklyWeatherAlamofireEndpoints {
    case weeklyWeather(city: String)
}

extension WeeklyWeatherAlamofireEndpoints: AlamofireEndpoint {
    var path: String {
        switch self {
        case .weeklyWeather(_):
            return "/forecast"
        }
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .weeklyWeather(_):
            return .get
        }
    }
    
    
    var parameters: Parameters? {
        switch self {
        case .weeklyWeather(let city):
            return ["q": city]
        }
    }
}
