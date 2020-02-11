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
    var savedMovie = SavedMovie(context: PersistanceService.context)

    var savedMovies = [SavedMovie]()
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
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
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
        
         let fetchRequest : NSFetchRequest<SavedMovie> = SavedMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "user = %@", user.email ?? "")

             do{
               let savedMovies = try PersistanceService.context.fetch(fetchRequest)
                self.savedMovies = savedMovies
                numberOfCellsTable = savedMovies.count

             }catch{
                 print("error loading previous data !")
             }
        return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        cell.textLabel?.text =  savedMovies[indexPath.row].title 


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        savedMovie = savedMovies[indexPath.row]
        print(savedMovie)
         let name = Notification.Name(rawValue: ObserverViewControllerNotificationKey)
        NotificationCenter.default.post(name: name, object: self, userInfo: [name: "hello"])
   //     print()
        self.performSegue(withIdentifier: "myMovieDetail", sender: self)

       }
   
}
