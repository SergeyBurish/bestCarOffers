//
//  ListPresenter.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation
import UIKit

class ListPresenter : ListInteractorOutput, ListModuleInterface {
    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?
    
    // MARK: ListInteractorOutput
    
    func foundUpcomingItems(_ upcomingItems: [UpcomingItem]) {
        if upcomingItems.count == 0 {
            userInterface?.showNoContentMessage()
        } else {
            updateUserInterfaceWithUpcomingItems(upcomingItems)
        }
    }
    
    func updateUserInterfaceWithUpcomingItems(_ upcomingItems: [UpcomingItem]) {
        let upcomingDisplayData = upcomingDisplayDataWithItems(upcomingItems)
        userInterface?.showUpcomingDisplayData(upcomingDisplayData)
    }
    
    func upcomingDisplayDataWithItems(_ upcomingItems: [UpcomingItem]) -> UpcomingDisplayData {
        let collection = UpcomingDisplayDataCollection()
        collection.addUpcomingItems(upcomingItems)
        return collection.collectedDisplayData()
    }
    
    // MARK: ListModuleInterface
    
    func updateView() {
        listInteractor?.findUpcomingItems()
    }
    
    func handleItemSelected(_ index: Int) {
        print(index)
    }
}
