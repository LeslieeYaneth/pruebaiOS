//
//  RedditModels.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import Foundation
import SwiftyJSON

// Protocol Ongoing
protocol Ongoing {
    // MARK: Properties
    var title: String! { get }
    var comment: String! { get }
    var selftext: String! { get }
    var author: String! { get }
}

struct OngoingReddit: Ongoing {
    // MARK: Properties
    let title: String!
    let comment: String!
    let selftext: String!
    let author: String!

    // MARK: - Init
    init(fromJSON json: JSON) {
        title = json["data"]["title"].stringValue
        comment = json["data"]["num_comments"].stringValue
        selftext = json["data"]["selftext"].stringValue
        author = json["data"]["author_fullname"].stringValue
    }
}
