//
//  UpcomingItem.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation

struct UpcomingItem : Equatable {
    let img : String
    let title : String
    
    init(img: String, title: String) {
        self.img = img
        self.title = title
    }
}

func == (a: UpcomingItem, b: UpcomingItem) -> Bool {
    return a.img == b.img && a.title == b.title
}
