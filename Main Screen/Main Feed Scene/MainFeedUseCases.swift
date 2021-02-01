//
//  MainFeedUseCases.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import UIKit

enum MainFeed {
    struct GetOngoingReddit {
        struct Response {
            let ongoingReddit: [Ongoing]
            let error: Bool?
        }

        struct ViewModel {
            let error: Bool?
            let errorMessage: String?
        }
    }
}
