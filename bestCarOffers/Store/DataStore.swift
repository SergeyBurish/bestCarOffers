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
    "mileage": 172000,
    "year": 2005,
    "owners": 3,
    "descr": "good state",

},
{
    "imgPrev": "BmwM2prev",
    "carImage": "BmwM2",
    "makeModel": "BMW M2",
    "state": "used",
    "price": 40000,
    "mileage": 540,
    "year": 2017,
    "owners": 1,
    "descr": "small crack on windshield",
},
{
    "imgPrev": "FordCMaxprev",
    "carImage": "FordCMax",
    "makeModel": "Ford C-Max",
    "state": "new",
    "price": 17000,
    "mileage": 0,
    "year": 2022,
    "owners": 0,
    "descr": "",
},
{
    "imgPrev": "HondaCivicprev",
    "carImage": "HondaCivic",
    "makeModel": "Honda Civic",
    "state": "used",
    "price": 23000,
    "mileage": 97000,
    "year": 2017,
    "owners": 1,
    "descr": "restored after accident",
},
{
    "imgPrev": "KiaRioprev",
    "carImage": "KiaRio",
    "makeModel": "Kia Rio",
    "state": "new",
    "price": 47000,
    "mileage": 3,
    "year": 2021,
    "owners": 0,
    "descr": "",
}]
"""


class DataStore {
    var carItems: [CarItem] = []
    var filtered: [CarItem] = []
    var filter: String = ""
    var selectedIndex = -1
    
    init() {
        let jsonData = mockJSON.data(using: .utf8)!
        carItems = try! JSONDecoder().decode([CarItem].self, from: jsonData)
    }
    
    func fetchAllEntries(filter: String, completionBlock: (([CarItem], String) -> Void)!) {
        self.filter = filter
        self.filtered = filter.isEmpty ? self.carItems : self.carItems.filter { carItem in
            return carItem.makeModel.range(of: filter, options: .caseInsensitive) != nil
        }
        // async request
        completionBlock(filtered, self.filter)
    }
    
    func fetchSelectedEntry(completionBlock: ((CarItem) -> Void)!) {
        if (selectedIndex < 0) {return}
        
        // async request
        completionBlock(self.filtered[selectedIndex])
    }
}
