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
    

    
    //================= view did load =====================
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = user.email
        tableview.delegate = self
        tableview.dataSource = self
    }
    

    @IBAction func searchClicked(_ sender: Any) {
        AF.request("https://api.letsbuildthatapp.com/jsondecodable/courses").responseJSON { response in

                    do{
                        let courses = try self.decoder.decode([Course].self , from: response.data! )
                        self.courses = courses
              //object where the data will be saved >>    decoder method. decode ( model , from data object )

                        print(courses)
                        self.tableview.reloadData()
                    }catch{
                        print("error parsing json data")  }

                    }

                }
    
    //======================= tableview ===================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = courses.count
         return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        cell.textLabel?.text =  courses[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)

       }
    
    
    }
    

  



