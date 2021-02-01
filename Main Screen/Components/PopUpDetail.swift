//
//  PopUpDetail.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 01/02/21.
//

import UIKit

class PopUpDetail: BaseViewController {
    @IBOutlet weak var detailLbl: UILabel!
    var detail = ""
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        detailLbl.text = detail
    }

    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
