//
//  DataStore.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation


let mockJSON = """
[{
    "name": "car01"
},
{
    "name": "car02"
},
{
    "name": "car03"
}]
"""


class DataStore {
    var carItems: [CarItem] = []
    
    init() {
        let jsonData = mockJSON.data(using: .utf8)!
        carItems = try! JSONDecoder().decode([CarItem].self, from: jsonData)
    }
    
    func fetchEntriesWithPredicate(completionBlock: (([CarItem]) -> Void)!) {
        completionBlock(self.carItems)
    }
}
