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
        
        listInteractor.output = listPresenter
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        
        listDataManager.dataStore = dataStore
    }
}
