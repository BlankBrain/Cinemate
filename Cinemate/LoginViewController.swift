//
//  LoginViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    let temp = User(context: PersistanceService.context)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
                if validateEmail(enteredEmail: emailInput.text!) == true  && validatPassword(enteredPassword:
                    passwordInput.text!) == true {
                    
                    //=============== firebase code
                    Auth.auth().signIn(withEmail: emailInput.text!, password: passwordInput.text!) { (authDataResult, error) in
                        guard error == nil else{
                            AlartController.showAlart(self, title: "Error", message: error?.localizedDescription ?? "error")
                            return
                        }
                        guard let authDataResult = authDataResult else {
                            AlartController.showAlart(self, title: "Error", message: "User not found!")
                            return
                        }
                        print(authDataResult.user.email ?? "missing user info")
                        
                        // ================ coredata user save ============
                        self.temp.email = authDataResult.user.email
                      // self.deleteAllUsers()
                        //PersistanceService.saveContext()
                        self.userHandeler()
                        self.showAllUsers()

                        //================= segue ======================
                        
                        self.performSegue(withIdentifier: "logIn", sender: self)
                        
                    }
                    
                }else if (validateEmail(enteredEmail: emailInput.text!) == false  && validatPassword(enteredPassword: passwordInput.text!) == true) {
                    AlartController.showAlart(self, title: "Error", message: "Incorrect Email!")
                }
                else if (validateEmail(enteredEmail: emailInput.text!) == true  && validatPassword(enteredPassword: passwordInput.text!) == false) {
                    AlartController.showAlart(self, title: "Error", message: "Password requerments are not fulfilled !")
                }
                else{
                    AlartController.showAlart(self, title: "Error", message: "Incomplete Information!")
                }
        
    }
    
    //====================================== func ====================================
    
    func validateEmail(enteredEmail:String) -> Bool {

          let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
          return emailPredicate.evaluate(with: enteredEmail)

      }
    
    func validatPassword(enteredPassword:String ) -> Bool {
        if enteredPassword != "" {
            return true
        }
        else{
            return false
        }
    }
    //================================== coredata func =================================
    func userHandeler()  {
              let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email = %@", emailInput.text!)
                do{
                    let users = try PersistanceService.context.fetch(fetchRequest)
                    if users.first != nil && users.first?.email == emailInput.text{
                        print("this user already exist !")
                    }
                    else{
                        let userToAdd = User(context: PersistanceService.context)
                        userToAdd.email = emailInput.text ?? ""
                        PersistanceService.saveContext()
                        self.showAllUsers()
                    }
                }catch{
                    print("error loading users !")
                }
    }
    
    func showAllUsers()  {
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do{
          let users = try PersistanceService.context.fetch(fetchRequest)
            print(users.count)
            for item in users{
                print(item.email)
            }

        }catch{
            print("error loading previous data !")
        }
    }
    func deleteAllUsers()  {
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do{
            let users = try PersistanceService.context.fetch(fetchRequest)
            print(users.count)
            for item in users{
                PersistanceService.context.delete(item)
                 PersistanceService.saveContext()
            }
        }catch{
            print("error deleting users !")
        }
        
    }
    // =============================== segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let HomeViewController = segue.destination as? HomeViewController else {return}
        HomeViewController.user = self.temp

    }

}
