//
//  DetailsDataManager.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation

class DetailsDataManager {
    var dataStore : DataStore?

    func carItemMatching(completion: ((CarItem) -> Void)!) {
        dataStore?.fetchSelectedEntry(
            completionBlock: { item in
                completion(item)
        })
    }
}
