//
//  HomeViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    var user = User(context: PersistanceService.context)
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        emailLabel.text = user.email
    }
    
    @IBAction func logOutClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "logOut", sender: self)

    }
    
    @IBAction func searchMovieClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "searchResult", sender: self) 
    }
    
    @IBAction func findTheaterClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToMap", sender: self)

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SearchViewController = segue.destination as? SearchViewController else {return}
        SearchViewController.user = self.user

    }
}
extension HomeViewController :  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = 1
        return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        cell.textLabel?.text =  "movie title"


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("item selected at ",  indexPath.row)

       }
   
}
