//
//  HttpService.swift
//  Chat App
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation
import Alamofire

class HttpService: HttpServicing {
    func getRequest<T: Codable>(url: String, success: @escaping (T) -> Void,
                                error: @escaping (NetworkingError) -> Void) {
        Alamofire.request(url).responseJSON { response in
            if response.error != nil {
                error(.requestFailed)
                return
            }
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let model = try jsonDecoder.decode(T.self, from: data)
                    success(model)
                } catch _ {
                    error(.jsonConversionFailure)
                }
            }
        }
    }
    
    func postRequest<T: Codable>(url: String, parameters: [String: Any], success: @escaping (T) -> Void,
                                    error: @escaping (NetworkingError) -> Void) {
        Alamofire.request(url, method: .post, parameters: parameters,
                          encoding: JSONEncoding.default).responseJSON { response in
                            if response.error != nil {
                                error(.requestFailed)
                                return
                            }
                            if let data = response.data {
                                do {
                                    let jsonDecoder = JSONDecoder()
                                    let model = try jsonDecoder.decode(T.self, from: data)
                                    success(model)
                                } catch _ {
                                    error(.jsonConversionFailure)
                                }
                            }
        }
    }
}
