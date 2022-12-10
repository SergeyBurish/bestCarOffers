//
//  ListInteractorIO.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation


protocol ListInteractorInput {
    func findUpcomingItems()
    func handleSelected(index: Int)
}

protocol ListInteractorOutput {
    func foundUpcomingItems(_ upcomingItems: [UpcomingItem])
}
