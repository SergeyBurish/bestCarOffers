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
    
    func foundUpcomingItems(_ upcomingItems: [UpcomingItem], filter: String) {
        let upcomingDisplayData = upcomingDisplayDataWithItems(upcomingItems, filter: filter)
        userInterface?.showUpcomingDisplayData(upcomingDisplayData)
    }
    
    func upcomingDisplayDataWithItems(_ upcomingItems: [UpcomingItem], filter: String) -> UpcomingDisplayData {
        let collection = UpcomingDisplayDataCollection()
        collection.addUpcomingItems(upcomingItems)
        collection.filter = filter
        return collection.collectedDisplayData()
    }
    
    // MARK: ListModuleInterface
    
    func updateView(filter: String) {
        listInteractor?.findUpcomingItems(filter: filter)
    }
    
    func handleItemSelected(_ index: Int) {
        listInteractor?.handleSelected(index: index)
        listWireframe?.presentDetailsInterface()
    }
}
