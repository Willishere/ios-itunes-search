//
//  SearchResultsTableViewController.swift
//  iTunes App
//
//  Created by William Chen on 9/3/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    


    let searchResultController = SearchResultController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultController.searchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Results Cell", for: indexPath) as? ResultsTableViewCell else {return UITableViewCell()}
        
        cell.searchResult = searchResultController.searchResults[indexPath.row]
        
        // Configure the cell...

        return cell
    }
    private func updateDataSource(){
        var sortedAndFilteredResults: [SearchResult]
    }
}

    
    extension SearchResultsTableViewController : UISearchBarDelegate {
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
            guard let searchTerm = searchBar.text else { return }
            
            var resultType: ResultType?
            switch segmentedControl.selectedSegmentIndex {
            case 1:
                resultType = ResultType.software
            case 2:
                resultType = ResultType.movie
            case 3:
                resultType = ResultType.musicTrack
            
            default:
                resultType = ResultType
            }
            searchResultController.performSearch(with: searchTerm, resultType: resultType!){
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
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


