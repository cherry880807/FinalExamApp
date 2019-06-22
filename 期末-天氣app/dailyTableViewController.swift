//
//  dailyTableViewController.swift
//  期末-天氣app
//
//  Created by User02 on 2019/6/22.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit

class dailyTableViewController: UITableViewController {
    var dailys=[Daily]()
    



    @IBOutlet var selectTableView: UITableView!

    @IBAction func unwind(segue: UIStoryboardSegue) {
        if let controller = segue.source as? dailyViewController, let daily = controller.daily{
            
            dailys.insert(daily, at: 0)
            Daily.saveToFile(dailys: dailys)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dailys = Daily.readDailysFromFile() {
            self.dailys = dailys
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of rows
        return dailys.count
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dailys.remove(at: indexPath.row)
        Daily.saveToFile(dailys: dailys)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! dailyTableViewCell

        // Configure the cell...
        let daily = dailys[indexPath.row]
        cell.dailyDetail.text = daily.date
        cell.dailyTitle.text=daily.theme
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       
        if segue.destination is postViewController{
            let controller = segue.destination as! postViewController
            
            let indexPath = self.selectTableView.indexPathForSelectedRow
            let Select = dailys[indexPath!.row]
            controller.select = Select
        }
        

        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
