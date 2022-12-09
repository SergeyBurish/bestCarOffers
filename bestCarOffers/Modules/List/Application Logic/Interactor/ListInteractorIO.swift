//
//  ListInteractorIO.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation


protocol ListInteractorInput {
    func findUpcomingItems()
}

protocol ListInteractorOutput {
    func foundUpcomingItems(_ upcomingItems: [UpcomingItem])
}
