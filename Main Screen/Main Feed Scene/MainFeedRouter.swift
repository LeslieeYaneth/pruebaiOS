//
//  MainFeedRouter.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import UIKit

@objc protocol MainFeedRoutingLogic {
    func routeToDetail()
}

protocol MainFeedDataPassing {
    var dataStore: MainFeedDataStore? { get }
}
class MainFeedRouter: NSObject, MainFeedDataPassing, MainFeedRoutingLogic {
    weak var viewController: MainFeedViewController?
    var dataStore: MainFeedDataStore?

    func routeToDetail() {
        guard let viewC = viewController else { return }
        let destination = UIStoryboard.main.instantiateViewController(withIdentifier: "PopUpDetail") as? PopUpDetail
        destination!.detail = viewC.detailSelect
        destination!.modalTransitionStyle = .crossDissolve
        destination!.modalPresentationStyle = .overCurrentContext
        viewC.present(destination!, animated: true, completion: nil)
   }
}
