//
//  DetailsPresenter.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation
import UIKit

class DetailsPresenter : DetailsModuleInterface, DetailsInteractorOutput {
    var detailsInteractor : DetailsInteractorInput?
    var userInterface : DetailsViewInterface?
    
    func updateView() {
        detailsInteractor?.findUpcomingItem()
    }
    
    func foundUpcomingItem(_ upcomingItem: UpcomingItem) {
        userInterface?.showDisplayData(upcomingItem)
    }
}
