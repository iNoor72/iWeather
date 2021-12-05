//
//  Router.swift
//  iWeather
//
//  Created by Noor Walid on 12/04/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    
    case todayWeather(city: String)
    case weeklyWeather(city: String)
    
    var method: HTTPMethod {
        switch self {
        case .todayWeather(_):
            return .get
            
        case .weeklyWeather(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .todayWeather(_):
            return "/weather?appid=\(Constants.API_Key)"
        case .weeklyWeather(_):
            return "/forecast?appid=\(Constants.API_Key)"
        }
    }
    
    var parameters: [String:Any]? {
        switch self {
        case .todayWeather(let city):
            return ["q":city]
        case .weeklyWeather(let city):
            return ["q":city]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURL)
        var request = URLRequest(url: (url!.appendingPathComponent(path)))
        switch self {
        case .weeklyWeather(city: _):
            request = try URLEncoding.default.encode(request, with: parameters)
        case .todayWeather(city: _):
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        return request
        
    }
}
