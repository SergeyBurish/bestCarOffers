//
//  DetailsInteractorIO.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation

protocol DetailsInteractorInput {
    func findDetailsItem()
}

protocol DetailsInteractorOutput {
    func foundDetailsItem(_ detailsItem: DetailsItem)
}
