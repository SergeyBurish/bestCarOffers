//
//  TodoItem.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation

struct CarItem: Decodable {
    let imgPrev: String
    let carImage: String
    let makeModel: String
    let state: String
    let price: Int
    let mileage: Int
}
