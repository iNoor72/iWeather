//
//  MoyaRouter.swift
//  iWeather
//
//  Created by Noor Walid on 15/04/2021.
//

import Foundation
import Moya

enum MoyaRouter {
    static let baseURL = "api.openweathermap.org/data/2.5"
    
    case dailyWeather
    case weeklyWeather
    
    var path: String {
        switch self {
        case .dailyWeather:
            return "/weather?appid=\(Constants.API_Key)"
        case .weeklyWeather:
            return "/forecast?appid=\(Constants.API_Key)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dailyWeather:
            return .get
        case .weeklyWeather:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["q":"cityName"], encoding: URLEncoding.default)
    }
    
    var headers: [String:String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
