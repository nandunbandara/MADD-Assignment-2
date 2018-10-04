//
//  AppTableViewController.swift
//  MADD-Assignment-2
//
//  Created by Nandun Bandara on 10/4/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {
    
    var apps = [Application]()
    
    private func loadApplications() {
        API.fetchApplications("", limit: 100, entity: "Software", completion: self.callback)
    }
    
    private func callback(_ applications: [Application]?) -> Void {
        if applications != nil {
            self.apps = applications!
        }
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Controller loaded")
        self.loadApplications()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        print("number of sections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count")
        print(self.apps.count)
        return self.apps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ApplicationTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? ApplicationTableViewCell else {
                fatalError("The dequeued cell is not an instance of ApplicationTableViewCell.")
            }
        
        let app = apps[indexPath.row]
        
        cell.nameLabel.text = app.name
        print(app.name)
        let photoUrl = app.imageUrl
        
        if app.imageUrl != nil {
            print(app.imageUrl)
            let url = URL(string: app.imageUrl!)
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            cell.imageView?.image = UIImage(data: data!)
        }
        cell.ownerLabel.text = app.sellerName
       
//        cell.ownerLabel.text = app.avgRating
        
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
