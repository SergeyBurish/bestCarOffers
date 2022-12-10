//
//  UpcomingDisplayItem.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

struct UpcomingDisplayItem {
    let img : String
    let title : String
}

extension UpcomingDisplayItem : Equatable {
    static func == (a: UpcomingDisplayItem, b: UpcomingDisplayItem) -> Bool {
        return a.img == b.title && a.img == b.title
    }
}

extension UpcomingDisplayItem: CustomStringConvertible {
    var description : String {
        return "title: \(title)"
    }
}
