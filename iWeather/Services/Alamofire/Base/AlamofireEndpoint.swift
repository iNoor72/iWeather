//
//  Alamofire-Endpoint.swift
//  iWeather
//
//  Created by Noor Walid on 23/04/2022.
//

import Foundation
import Alamofire

protocol AlamofireEndpoint: URLRequestConvertible {
    
    //Assign default values when needed to be used across all endpoints subclassing this protocol.
    var baseURL: URL { get }
    
    var requestURL: URL { get }
    
    var headers: HTTPHeaders { get }

    var encoding: ParameterEncoding { get }
    
    //Implemented by the enums subclassing this protocol.
    var path: String { get }

    var parameters: Parameters? { get }
    
    var method: HTTPMethod { get }
}

extension AlamofireEndpoint {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { fatalError("BaseURL couldn't be fetched.") }
        return url
    }
    
    var requestURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        return ["":""]
    }
    
    var parameters: Parameters? {
        return ["appid": Constants.API_Key]
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.name) }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        try encoding.encode(urlRequest, with: parameters)
    }
    
}
