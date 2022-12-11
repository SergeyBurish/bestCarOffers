//
//  ListModuleInterface.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

protocol ListModuleInterface {
    func updateView(filter: String)
    func handleItemSelected(_ index: Int)
}
