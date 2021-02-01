//
//  MainFeedViewController.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//
import UIKit
import AccountKit

protocol MainFeedDisplayLogic: class {
    func displayOngoingError(_ viewModel: MainFeed.GetOngoingReddit.ViewModel)
    func displayOngoing(_ viewModel: MainFeed.GetOngoingReddit.Response)
}

class MainFeedViewController: BaseViewController {
    internal var interactor: (MainFeedBusinessLogic & MainFeedDataStore)?
    internal var router: (NSObjectProtocol & MainFeedRoutingLogic & MainFeedDataPassing)?

    @IBOutlet weak var tableView: UITableView!
    var reddit: [Ongoing] = []
    var detailSelect = ""

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = MainFeedInteractor()
        let presenter = MainFeedPresenter()
        let router = MainFeedRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor!.requestReddit()
    }
}

// MARK: - Display Logic Methods
extension MainFeedViewController: MainFeedDisplayLogic {
    func displayOngoingError(_ viewModel: MainFeed.GetOngoingReddit.ViewModel) {
        let alert = UIAlertController(title: "Atención", message: viewModel.errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func displayOngoing(_ viewModel: MainFeed.GetOngoingReddit.Response) {
        reddit = viewModel.ongoingReddit
        tableView.reloadData()
    }
}

// MARK: - TableView View Methods
extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reddit.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reddit", for: indexPath) as! RedditCell
        cell.titleLbl.text = reddit[indexPath.row].title
        cell.commentLbl.text = reddit[indexPath.row].comment
        cell.authorLbl.text = reddit[indexPath.row].author
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = reddit[indexPath.row]
        detailSelect = item.selftext
        router!.routeToDetail()
    }
}
