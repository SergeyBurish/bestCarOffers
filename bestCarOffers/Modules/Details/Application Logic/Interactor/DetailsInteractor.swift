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
    
    func findDetailsItem() {
        dataManager.carItemMatching(
            completion: { carItem in
                let detailsItem = DetailsItem(img: carItem.carImage,
                                              title: carItem.makeModel,
                                              state: carItem.state,
                                              price: carItem.price,
                                              mileage: carItem.mileage)
                self.output?.foundDetailsItem(detailsItem)
        })
    }
}
