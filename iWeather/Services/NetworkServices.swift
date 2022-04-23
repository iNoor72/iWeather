//
//  NetworkServices.swift
//  iWeather
//
//  Created by Noor Walid on 24/04/2022.
//

import Foundation

protocol NetworkServices {
    func send<T: Decodable, E: AlamofireEndpoint>(endpoint: E, expectedType: T.Type, completion: @escaping (Result<T,Error>) -> Void)
    
    
}
