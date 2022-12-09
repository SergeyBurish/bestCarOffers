//
//  UpcomingItem.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation

struct UpcomingItem : Equatable {
    let title : String
    
    init(title: String) {
        self.title = title
    }
}

func == (a: UpcomingItem, b: UpcomingItem) -> Bool {
    return a.title == b.title
}
