//
//  ListViewController.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation
import UIKit

var ListEntryCellIdentifier = "ListEntryCell"

class ListViewController : UITableViewController, ListViewInterface {
    var eventHandler : ListModuleInterface?
    var dataProperty : UpcomingDisplayData?
    var strongTableView : UITableView?
    
    @IBOutlet var noContentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongTableView = tableView
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    func configureView() {
        navigationItem.title = "Best Car Offers"
    }
    
    // MARK: ListViewInterface
    
    func showNoContentMessage() {
        view = noContentView
    }
    
    func showUpcomingDisplayData(_ data: UpcomingDisplayData) {
        view = strongTableView
        
        dataProperty = data
        reloadEntries()
    }
    
    func reloadEntries() {
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProperty?.items.count ?? 0
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListEntryCellIdentifier, for: indexPath) as UITableViewCell

        let item = dataProperty?.items[indexPath.row]

        cell.textLabel?.text = item?.title
        cell.detailTextLabel?.text = "---"
        cell.imageView?.image = UIImage(named: "car")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;

        return cell
    }
}
