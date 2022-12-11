//
//  ListViewInterface.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

protocol ListViewInterface {
    func showUpcomingDisplayData(_ data: UpcomingDisplayData)
    func reloadEntries()
}
