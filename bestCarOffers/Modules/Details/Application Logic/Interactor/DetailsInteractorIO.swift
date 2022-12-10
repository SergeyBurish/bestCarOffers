//
//  DetailsInteractorIO.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation

protocol DetailsInteractorInput {
    func findUpcomingItem()
}

protocol DetailsInteractorOutput {
    func foundUpcomingItem(_ upcomingItem: UpcomingItem)
}
