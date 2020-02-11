//
//  MyMovieDetailViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 11/2/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit

let ObserverViewControllerNotificationKey = "com.mehedi.observer2"

class MyMovieDetailViewController: UIViewController {

    let name = Notification.Name(rawValue: ObserverViewControllerNotificationKey)
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releseLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var rtLabel: NSLayoutConstraint!
    @IBOutlet weak var metaLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var actorTextView: UITextView!
    @IBOutlet weak var boxLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    var savedMovie = SavedMovie(context: PersistanceService.context)
    
    
    
    
    override func viewDidLoad() {
        createObserver()
        super.viewDidLoad()
    }
    
    func createObserver() {
          NotificationCenter.default.addObserver(self, selector: #selector(MyMovieDetailViewController.updateMovieDetails(notification:)), name: name, object: nil)
      }
      
    @objc func updateMovieDetails(notification: NSNotification) {
            if notification.name == name {
                let userInfo = notification.userInfo!
                let something = userInfo[name]! as! String
                self.imdbLabel.text = something
                print(something)
            }
        }
 

}

