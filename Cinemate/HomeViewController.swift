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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = user.email
    }
    
    @IBAction func logOutClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "logOut", sender: self)

    }
    
    @IBAction func searchMovieClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "searchResult", sender: self) 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SearchViewController = segue.destination as? SearchViewController else {return}
        SearchViewController.user = self.user

    }
}
