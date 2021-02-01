//
//  MainFeedPresenter.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import UIKit

protocol MainFeedPresentationLogic {
    func presentOngoingReddit(_ response: MainFeed.GetOngoingReddit.Response)
}

class MainFeedPresenter: MainFeedPresentationLogic {
    // MARK: - Properties
    weak var viewController: MainFeedDisplayLogic?
    func presentOngoingReddit(_ response: MainFeed.GetOngoingReddit.Response) {
        let error = response.error
        if error! {
            let viewModel = MainFeed.GetOngoingReddit.ViewModel(error: true, errorMessage: "Ocurrió un error al consultar los datos.")
            viewController?.displayOngoingError(viewModel)
        } else {
            let viewModel = MainFeed.GetOngoingReddit.Response(ongoingReddit: response.ongoingReddit, error: response.error)
            viewController?.displayOngoing(viewModel)
        }
    }
}
