//
//  AppDependencies.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 07.12.2022.
//

import Foundation
import UIKit

class AppDependencies {
    var listWireframe = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let dataStore = DataStore()
        let rootWireframe = RootWireframe()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        let detailsWireframe = DetailsWireframe()
        let detailsPresenter = DetailsPresenter()
        let detailsDataManager = DetailsDataManager()
        let detailsInteractor = DetailsInteractor(dataManager: detailsDataManager)
        
        listInteractor.output = listPresenter
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        
        listWireframe.detailsWireframe = detailsWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        
        listDataManager.dataStore = dataStore
        
     
        detailsInteractor.output = detailsPresenter
        
        detailsWireframe.detailsPresenter = detailsPresenter
        detailsPresenter.detailsInteractor = detailsInteractor
        
        detailsDataManager.dataStore = dataStore
    }
}
