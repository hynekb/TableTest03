//
//  DogTableViewController.swift
//  TableTest03
//
//  Created by Hynek Broulik on 2020-04-16.
//  Copyright © 2020 Hynek Broulik. All rights reserved.
//

import UIKit

class DogTableViewController: UITableViewController {
    
    //MARK:- Variables

    var allDogs: [Dog] = []
    
    //MARK: - View controller functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogRepo.shared.generateDogs()
        allDogs = DogRepo.shared.allDogs
        print("viewDidLoad: allDogs = \(allDogs)")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDogs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath)

        // Configure the cell...
        let dog = allDogs[indexPath.row]
        cell.textLabel?.text = dog.name
        cell.detailTextLabel?.text = dog.number
        cell.imageView?.image = UIImage(named: "leaf")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAACRecViewController(dogIndex: indexPath.row)
    }
    
    //if the acccessory disclousere is tapped, we present EditViewController
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        presentEditViewController(dogIndex: indexPath.row)
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            allDogs.remove(at:indexPath.row)
            //TODO implement a function to delete the element from the dog file
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
   

    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("prepare for segue called")
    }
    
    //
    func presentEditViewController(dogIndex: Int){
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
            else { fatalError("Unable to create EditDog View Controller")
        }
        viewController.dogIndex = dogIndex
        show(viewController, sender: self)
    }
    
    func presentAACRecViewController(dogIndex: Int){
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "AACRecViewController") as? AACRecViewController
            else { fatalError("Unable to create AAVRec View Controller")
        }
        viewController.dogIndex = dogIndex
        show(viewController, sender: self)
    }
    
    @IBAction func unwind( _ segue:UIStoryboardSegue) {
        
    }
}
