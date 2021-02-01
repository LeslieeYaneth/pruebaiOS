//
//  LeslieAPI.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import Alamofire

enum LeslieAPI {
    // Login Endpoints
    case getReddit
}

// MARK: - Endpoint Declaration
extension LeslieAPI: APIEndpoint {
    var baseURL: String! {
        switch self {

        default:
            return LeslieURLS.restURL
        }
    }

    var path: String! {
        switch self {
        case .getReddit:
            return "r/androiddev.json"
        }
    }

    var method: HTTPMethod! {
        switch self {

//        case .:
//            return .post

        default:
            return .get
        }
    }

    var headers: HTTPHeaders! {
        return ["X-Authorization": LeslieURLS.apiKey]
    }

    var parameters: [String: Any]? {
        switch self {
//        case .(let params):
//            return params

        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding! {
        return URLEncoding.default
    }
}
