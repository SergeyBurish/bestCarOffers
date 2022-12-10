//
//  DetailsInteractor.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation

class DetailsInteractor : DetailsInteractorInput {
    var output : DetailsInteractorOutput?
    
    let dataManager : DetailsDataManager
    
    init(dataManager: DetailsDataManager) {
        self.dataManager = dataManager
    }
    
    func findUpcomingItem() {
        dataManager.carItemMatching(
            completion: { carItem in
                let upcomingItem = UpcomingItem(img: "",
                                                title: carItem.makeModel,
                                                price: carItem.price)
                self.output?.foundUpcomingItem(upcomingItem)
        })
    }
}
