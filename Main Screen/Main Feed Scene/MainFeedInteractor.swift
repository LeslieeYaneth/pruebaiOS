//
//  MainFeedInteractor.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import Foundation
import PromiseKit

protocol MainFeedBusinessLogic {
    func requestReddit()
}

protocol MainFeedDataStore {
}

class MainFeedInteractor: MainFeedBusinessLogic, MainFeedDataStore {
    // MARK: Properties
    internal var presenter: MainFeedPresentationLogic?
    private let worker = RedditWorker()

    func requestReddit() {
        worker.getAllReddit().done { reddit in
            let response = MainFeed.GetOngoingReddit.Response(ongoingReddit: reddit, error: false)
            self.presenter?.presentOngoingReddit(response)
        }.catch { error in
            let reddit: [Ongoing] = []
            let response = MainFeed.GetOngoingReddit.Response(ongoingReddit:reddit, error: true)
            self.presenter?.presentOngoingReddit(response)
        }
    }
}
