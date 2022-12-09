//
//  UpcomingDisplayDataCollection.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class UpcomingDisplayDataCollection {
    var items: [UpcomingDisplayItem] = []
        
    func addUpcomingItems(_ upcomingItems: [UpcomingItem]) {
        for upcomingItem in upcomingItems {
            addUpcomingItem(upcomingItem)
        }
    }
    
    func addUpcomingItem(_ upcomingItem: UpcomingItem) {
        let displayItem = UpcomingDisplayItem(title: upcomingItem.title)
        items.insert(displayItem, at: items.endIndex)
    }
    
    func collectedDisplayData() -> UpcomingDisplayData {
        return UpcomingDisplayData(items: items)
    }
}
