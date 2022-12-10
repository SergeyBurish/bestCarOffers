//
//  DetailsViewController.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 09.12.2022.
//

import Foundation
import UIKit


class DetailsViewController : UIViewController, DetailsViewInterface {
    var eventHandler : DetailsModuleInterface?
    
    @IBOutlet weak var name: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.updateView()
    }
    
    func showDisplayData(_ item: UpcomingItem) {
        name.text = item.title
    }
}
