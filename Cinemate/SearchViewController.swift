//
//  SearchViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class SearchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
   //=================== var ============================
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var tableview: UITableView!
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    let decoder = JSONDecoder()
    var user = User(context: PersistanceService.context)
    var courses = [Course]()
    var movieSearchResult1 = [movieSearchResult]()

    
    //================= view did load =====================
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = user.email
        tableview.delegate = self
        tableview.dataSource = self
    }
    

    @IBAction func searchClicked(_ sender: Any) {
        AF.request("http://www.omdbapi.com/?apikey=df031d45&s=titanic").responseJSON { response in

                    do{
                        let movieSearchResult1 = try self.decoder.decode([movieSearchResult].self , from: response.data! )
                        self.movieSearchResult1 = movieSearchResult1
              //object where the data will be saved >>    decoder method. decode ( model , from data object )

                        print(movieSearchResult1)
                        self.tableview.reloadData()
                    }catch{
                        print("error parsing json data")  }

                    }

                }
    
    //======================= tableview ===================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = movieSearchResult1.first?.Search.count ?? 1
         return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        cell.textLabel?.text =  movieSearchResult1.first?.Search.first?.Title ?? "No result found"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)

       }
    
    
    }
    

  



