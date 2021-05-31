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
    
    case todayWeather
    case weeklyWeather
    
    var method: HTTPMethod {
        switch self {
        case .todayWeather:
            return .get
            
        case .weeklyWeather:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .todayWeather:
            return "/weather?&appid=\(Constants.API_Key)&units=metric&"
        case .weeklyWeather:
            return "/forecast?&appid=\(Constants.API_Key)&units=metric&"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURL)
        let request = URLRequest(url: (url!.appendingPathComponent(path)))

        return request
        
    }
}