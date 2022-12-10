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
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var owners: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.updateView()
    }
    
    func showDisplayData(_ item: DetailsItem) {
        carTitle.text = item.title
        carImage.image = UIImage(named: (item.img))
        price.text = item.price
        state.text = item.state
        mileage.text = item.mileage
        year.text = item.year
        owners.text = item.owners
        descr.text = item.descr
    }
}
