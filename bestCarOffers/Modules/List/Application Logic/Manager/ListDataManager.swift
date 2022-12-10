//
//  ListDataManager.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation

class ListDataManager {
    var dataStore : DataStore?

    func carItemsMatching(completion: (([CarItem]) -> Void)!) {
                
        dataStore?.fetchAllEntries(
            completionBlock: { items in
                completion(items)
        })
    }
    
    func setSelected(index: Int) {
        dataStore!.selectedIndex = index
    }
}
