//
//  NetworkingError.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case conversionError
    case noData
    case jsonConversionFailure
    case jsonParsingFailure
    case invalidParameters
    case requestFailed
    case responseUnsuccessful
    case uploadFailed
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .invalidParameters: return "Error converting model to HTTP Parameters"
        case .noData: return "No Data"
        case .conversionError: return "Conversion Error"
        case .uploadFailed: return "Upload Failed"
        }
    }
}
