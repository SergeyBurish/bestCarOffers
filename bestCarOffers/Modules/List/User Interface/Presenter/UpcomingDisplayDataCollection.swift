//
//  UpcomingDisplayDataCollection.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class UpcomingDisplayDataCollection {
    var items: [UpcomingDisplayItem] = []
    var filter: String = ""
        
    func addUpcomingItems(_ upcomingItems: [UpcomingItem]) {
        for upcomingItem in upcomingItems {
            addUpcomingItem(upcomingItem)
        }
    }
    
    func addUpcomingItem(_ upcomingItem: UpcomingItem) {
        let displayItem = UpcomingDisplayItem(
            img: upcomingItem.img,
            title: upcomingItem.title,
            subtitle: upcomingItem.state,
            price: "$" + String(upcomingItem.price))
        items.insert(displayItem, at: items.endIndex)
    }
    
    func collectedDisplayData() -> UpcomingDisplayData {
        return UpcomingDisplayData(items: items, filter: filter)
    }
}
