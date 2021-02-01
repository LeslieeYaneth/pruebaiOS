//
//  RedditWorker.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import UIKit
import Alamofire
import PromiseKit

class RedditWorker {

    // MARK: Properties
    private let backQueue = DispatchQueue.global(qos: .default)

    // MARK: - Public Methods
    func getAllReddit() -> Promise<[Ongoing]> {
        let req = NetworkManager.request(endpoint: LeslieAPI.getReddit)
        return req.then(on: backQueue) { json -> Promise<[Ongoing]> in
            var ordersArray = [Ongoing]()
            for (_, element) in json["data"]["children"] {
                ordersArray.append(OngoingReddit(fromJSON: element))
            }
            return .value(ordersArray)
        }
    }
}
