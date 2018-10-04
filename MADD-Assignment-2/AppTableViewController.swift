//
//  AppTableViewController.swift
//  MADD-Assignment-2
//
//  Created by Nandun Bandara on 10/4/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apps = [Application]()
    
    private func loadApplications(_ term: String) {
        API.fetchApplications("puzzle", limit: 100, entity: "Software", completion: self.callback)
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
        self.loadApplications("")
    
    }
    
    // search on text change
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        loadApplications(searchText)
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
        
        if app.imageUrl != nil {
            let url = URL(string: app.imageUrl!)
            let data = try? Data(contentsOf: url!)
            cell.imageView?.image = UIImage(data: data!)
        }
        cell.ownerLabel.text = app.sellerName
       
//        cell.ownerLabel.text = app.avgRating
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(application: self.apps[indexPath.row]);
    }
    
    private func showAlert(application: Application){
        
        // set description
        application.description = application.sellerName
        var alert = UIAlertController(title: application.name, message: application.description , preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default,handler: nil))
        let imageView = UIImageView(frame:CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 50, height: 50)))
        
        if application.imageUrl != nil {
            let url = URL(string: application.imageUrl!)
            let data = try? Data(contentsOf: url!)
            imageView.image = UIImage(data: data!)
        }
        
        alert.view.addSubview(imageView)
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 450)
        let width: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)

        present(alert, animated: true, completion: nil)
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
