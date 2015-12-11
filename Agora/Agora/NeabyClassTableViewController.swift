//
//  NeabyClassTableViewController.swift
//  
//
//  Created by Vamsi Gadiraju on 10/23/15.
//
//

import UIKit

class NeabyClassTableViewController: PFQueryTableViewController, UISearchBarDelegate {
    
    // Table search bar
    @IBOutlet weak var classSearchBar: UISearchBar!
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Object"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! ClassItemTableViewCell!
        if cell == nil {
            cell = ClassItemTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CustomCell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let name = object?["name"] as? String {
            cell.newClassName.text = name
            println(name)
        }
        if let professor = object?["instructor"] as? String {
            cell.newProfname.text = professor
        }
        if let buildingName = object?["building"] as? String {
            cell.newBuildingName.text = buildingName
        }
        if let time = object?["startTime"] as? String {
            cell.newTiming.text = time
        }
        
        return cell
    }
    

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        // Get the new view controller using [segue destinationViewController].
//        var detailScene = segue.destinationViewController as! GeneralThreadTableViewController
//        
//        // Pass the selected object to the destination view controller.
//        if let indexPath = self.tableView.indexPathForSelectedRow() {
//            let row = Int(indexPath.row)
//            detailScene.currentObject = objects?[row] as? PFObject
//        }
//    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        
        // Start the query object
        var query = PFQuery(className: "Object")
        
        // Add a where clause if there is a search criteria
        if classSearchBar.text != "" {
            query.whereKey("name", containsString: classSearchBar.text.uppercaseString)
        }
        
        // Order the results
        query.orderByAscending("name")
        
        // Return the qwuery object
        return query
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        // Dismiss the keyboard
        classSearchBar.resignFirstResponder()
        
        // Force reload of table data
        self.loadObjects()
    }
    
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        // Dismiss the keyboard
        classSearchBar.resignFirstResponder()
        
        // Force reload of table data
        self.loadObjects()
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        // Clear any search criteria
        classSearchBar.text = ""
        
        // Dismiss the keyboard
        classSearchBar.resignFirstResponder()
        
        // Force reload of table data
        self.loadObjects()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()
        
        // Delegate the search bar to this table view class
        classSearchBar.delegate = self
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let objectToDelete = objects?[indexPath.row] as! PFObject
            objectToDelete.deleteInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // Force a reload of the table - fetching fresh data from Parse platform
                    self.loadObjects()
                } else {
                    // There was a problem, check error.description
                }
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
}
