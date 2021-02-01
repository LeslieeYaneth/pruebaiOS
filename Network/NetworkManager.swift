//
//  NetworkManager.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

// MARK: - Endpoint Protocol definition
protocol APIEndpoint {
    var baseURL: String! { get }
    var path: String! { get }
    var method: HTTPMethod! { get }
    var headers: HTTPHeaders! { get }
    var parameters: [String: Any]? { get }
    var parameterEncoding: ParameterEncoding! { get }
}

struct LeslieURLS {

    // API URLS
    static let restURL = "https://www.reddit.com/"

    // Yapp API Key
    static let apiKey = "4d646c6ab0b4ff4"
}

// MARK: - Network Errors
enum NetworkErrors: Error {
    case noData
}

// MARK: - Utility class for network calls.
class NetworkManager {

    // MARK: - Public Methods
    static func request(endpoint: APIEndpoint) -> Promise<JSON> {
        return Promise { seal in
            let fullURL = endpoint.baseURL + endpoint.path
            SessionManager.default.request(fullURL, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: endpoint.headers).responseJSON { response in
                if let error = response.result.error {
                    if let err = error as? AFError {
                        switch err {
                        case .responseSerializationFailed:
                            seal.reject(returnError(type: .noData))
                        default:
                            seal.reject(error)
                        }
                    } else {
                        seal.reject(error)
                    }
                } else if let value = response.result.value {
                    guard JSON(value) != JSON.null else {
                        seal.reject(returnError(type: .noData))
                        return
                    }
                    seal.fulfill(JSON(value))
                }
            }
        }
    }

    static func returnError(type: NetworkErrors) -> NSError {
        switch type {
        case .noData:
            let msg = "Ocurrió un error al consultar el servicio. ¿Quieres intentar nuevamente?"
            return NSError(domain: "Network", code: 400, userInfo: [NSLocalizedDescriptionKey: msg])
        }
    }
}
