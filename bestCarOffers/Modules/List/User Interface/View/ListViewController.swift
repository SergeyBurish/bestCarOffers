//
//  ListViewController.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import Foundation
import UIKit

var ListEntryCellIdentifier = "ListEntryCell"
var headerHeight: CGFloat = 40

class ListViewController : UITableViewController, UITextFieldDelegate, ListViewInterface {
    var eventHandler : ListModuleInterface?
    var dataProperty : UpcomingDisplayData?
    var strongTableView : UITableView?
    var filterStr: String = ""
    
    @IBOutlet var noContentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongTableView = tableView
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView(filter: filterStr)
    }
    
    func configureView() {
        navigationItem.title = "Best Car Offers"
    }
    
    // MARK: ListViewInterface
    
    func showUpcomingDisplayData(_ data: UpcomingDisplayData) {
        view = strongTableView
        
        dataProperty = data
        reloadEntries()
        
        filterStr = data.filter
    }
    
    func reloadEntries() {
        tableView.reloadData()
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let res = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        
        eventHandler?.updateView(filter: res)
        return true
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
                
        let edit = UITextField()
        edit.frame = CGRect.init(x: 10, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-10)
        edit.placeholder = "Enter text to filter"
        edit.delegate = self
        edit.backgroundColor = .white
        
        edit.text = filterStr

        headerView.addSubview(edit)
        
        headerView.backgroundColor = .gray
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProperty?.items.count ?? 0
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListEntryCellIdentifier, for: indexPath) as! ListCell

        let item = dataProperty?.items[indexPath.row]
        
        cell.cellImage.image = UIImage(named: (item?.img)!)
        cell.title1.text = item?.title
        cell.title2.text = item?.subtitle
        cell.price.text = item?.price
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.handleItemSelected(indexPath.row)
    }
}
