//
//  ListInteractor.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class ListInteractor : NSObject, ListInteractorInput {
    var output : ListInteractorOutput?
    
    let dataManager : ListDataManager
    
    init(dataManager: ListDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: ListInteractorInput
    
    func findUpcomingItems() {
        
        dataManager.carItemsMatching(
            completion: { carItems in
                let upcomingItems = self.upcomingItemsFromCarItems(carItems)
                self.output?.foundUpcomingItems(upcomingItems)
        })
    }
    
    func upcomingItemsFromCarItems(_ carItems: [CarItem]) -> [UpcomingItem] {
        let upcomingItems: [UpcomingItem] = carItems.map() { carItem in
            return UpcomingItem(title: carItem.name)
        }
        return upcomingItems
    }
}
