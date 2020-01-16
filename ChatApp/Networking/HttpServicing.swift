//
//  HttpServicing.swift
//  Chat App
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol HttpServicing {
    func getRequest<T: Codable>(url: String, success: @escaping (T) -> Void, error: @escaping (NetworkingError) -> Void)
    func postRequest<T: Codable>(url: String, parameters: [String: Any], success: @escaping (T) -> Void,
                                    error: @escaping (NetworkingError) -> Void)
}
