//
//  DetailsWireframe.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation
import UIKit

let DetailsViewControllerIdentifier = "DetailsViewController"

class DetailsWireframe {
    //var detailsViewController : DetailsViewController?
    
    func presentDetailsInterfaceFromViewController(_ viewController: UIViewController) {
        let newViewController = detailsViewControllerFromStoryboard()
        //detailsViewController = newViewController
        viewController.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    func detailsViewControllerFromStoryboard() -> DetailsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: DetailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
