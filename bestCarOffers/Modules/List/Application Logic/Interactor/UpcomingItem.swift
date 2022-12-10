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
    let price : Int
    
    init(img: String, title: String, price: Int) {
        self.img = img
        self.title = title
        self.price = price
    }
}

func == (a: UpcomingItem, b: UpcomingItem) -> Bool {
    return a.img == b.img &&
        a.title == b.title &&
        a.price == b.price
}
