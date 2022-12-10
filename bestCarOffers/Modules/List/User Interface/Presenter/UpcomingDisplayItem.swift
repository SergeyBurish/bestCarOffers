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
    let subtitle : String
    let price : String
}

extension UpcomingDisplayItem : Equatable {
    static func == (a: UpcomingDisplayItem, b: UpcomingDisplayItem) -> Bool {
        return a.img == b.img &&
            a.title == b.title &&
            a.subtitle == b.subtitle &&
            a.price == b.price
    }
}

extension UpcomingDisplayItem: CustomStringConvertible {
    var description : String {
        return "title: \(title) price: \(price)"
    }
}
