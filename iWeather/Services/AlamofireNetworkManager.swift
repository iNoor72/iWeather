//
//  NetworkManager.swift
//  iWeather
//
//  Created by Noor Walid on 24/04/2022.
//

import Foundation
import Alamofire

class AlamofireNetworkManager : NetworkServices {
    func send<T: Decodable, E: AlamofireEndpoint>(endpoint: E, expectedType: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        guard let url = try? endpoint.asURLRequest() else { return }
        AF.request(url).validate().responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
