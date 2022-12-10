//
//  ListInteractor.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class ListInteractor : ListInteractorInput {
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
    
    func handleSelected(index: Int) {
        dataManager.setSelected(index: index)
    }
    
    func upcomingItemsFromCarItems(_ carItems: [CarItem]) -> [UpcomingItem] {
        let upcomingItems: [UpcomingItem] = carItems.map() { carItem in
            return UpcomingItem(
                img: carItem.imgPrev,
                title: carItem.makeModel,
                price: carItem.price)
        }
        return upcomingItems
    }
}
