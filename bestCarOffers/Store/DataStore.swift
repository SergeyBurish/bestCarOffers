//
//  DataStore.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation


let mockJSON = """
[{
    "imgPrev": "AudiA8prev",
    "carImage": "AudiA8",
    "makeModel": "Audi A8",
    "state": "used",
    "price": 13500,
    "mileage": 172000

},
{
    "imgPrev": "BmwM2prev",
    "carImage": "BmwM2",
    "makeModel": "BMW M2",
    "state": "used",
    "price": 40000,
    "mileage": 540
},
{
    "imgPrev": "FordCMaxprev",
    "carImage": "FordCMax",
    "makeModel": "Ford C-Max",
    "state": "new",
    "price": 17000,
    "mileage": 0
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
