//
//  ListDataManager.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class ListDataManager {
    var dataStore : DataStore?

    func carItemsMatching(filter: String, completion: (([CarItem], String) -> Void)!) {
        dataStore?.fetchAllEntries(
            filter: filter, completionBlock: { (items, filterStr) in
                completion(items, filterStr)
        })
    }
    
    func setSelected(index: Int) {
        dataStore!.selectedIndex = index
    }
}
