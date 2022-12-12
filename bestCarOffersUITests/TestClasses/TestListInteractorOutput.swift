//
//  TestListInteractorOutput.swift
//  bestCarOffersUITests
//
//  Created by Sergey Burish on 12.12.2022.
//

import Foundation

class TestListInteractorOutput : ListInteractorOutput {
    var upcomingItems: [UpcomingItem]?
    func foundUpcomingItems(_ upcomingItems: [UpcomingItem], filter: String) {
        self.upcomingItems = upcomingItems
    }
}
