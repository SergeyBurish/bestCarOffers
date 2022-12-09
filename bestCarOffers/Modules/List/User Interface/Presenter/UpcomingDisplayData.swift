//
//  UpcomingDisplayData.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

struct UpcomingDisplayData {
    let items: [UpcomingDisplayItem]
}

extension UpcomingDisplayData : Equatable {
    static func == (a: UpcomingDisplayData, b: UpcomingDisplayData) -> Bool {
        return a.items == b.items
    }
}
