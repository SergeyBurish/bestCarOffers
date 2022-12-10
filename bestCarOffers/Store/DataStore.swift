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
    var selectedIndex = -1
    
    init() {
        let jsonData = mockJSON.data(using: .utf8)!
        carItems = try! JSONDecoder().decode([CarItem].self, from: jsonData)
    }
    
    func fetchAllEntries(completionBlock: (([CarItem]) -> Void)!) {
        // async request
        completionBlock(self.carItems)
    }
    
    func fetchSelectedEntry(completionBlock: ((CarItem) -> Void)!) {
        if (selectedIndex < 0) {return}
        
        // async request
        completionBlock(self.carItems[selectedIndex])
    }
}