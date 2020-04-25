//
//  SignUpViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import CoreData


class SignUpViewController: UIViewController {

 
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    let temp = User(context: PersistanceService.context)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //======================= Sign up ==================
    @IBAction func signUpClicked(_ sender: Any) {
        if ( Connectivity.isConnectedToInternet() == true ){
        
        if validateEmail(enteredEmail: emailInput.text!) == true  && validatPassword(enteredPassword:
            passwordInput.text!, enteredPassword2: confirmPasswordInput.text!) == true {
            
            //=============== firebase code
            Auth.auth().createUser(withEmail: emailInput.text!, password: passwordInput.text!) { (authDataResult, error) in
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
//                let userChangeRequest = authDataResult.user.createProfileChangeRequest()
//                userChangeRequest.displayName = self.emailInput.text
//                
                self.temp.email = authDataResult.user.email
               PersistanceService.saveContext()
                //================= segue ======================
                
                self.performSegue(withIdentifier: "signUp", sender: self)
                
            }
            
        }else if (validateEmail(enteredEmail: emailInput.text!) == false  && validatPassword(enteredPassword: passwordInput.text!, enteredPassword2: confirmPasswordInput.text!) == true) {
            AlartController.showAlart(self, title: "Error", message: "Incorrect Email!")
        }
        else if (validateEmail(enteredEmail: emailInput.text!) == true  && validatPassword(enteredPassword: passwordInput.text!, enteredPassword2: confirmPasswordInput.text!) == false) {
            AlartController.showAlart(self, title: "Error", message: "Password requerments are not fulfilled !")
        }
        else{
            AlartController.showAlart(self, title: "Error", message: "Incomplete Information!")
        }
        
        }else{
            AlartController.showAlart(self, title: "Error", message: "No internet connection !")

        }
    }
    
    func validateEmail(enteredEmail:String) -> Bool {

          let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
          return emailPredicate.evaluate(with: enteredEmail)

      }
    
    func validatPassword(enteredPassword:String , enteredPassword2:String) -> Bool {
        if enteredPassword == enteredPassword2 && enteredPassword != "" {
            return true
        }
        else{
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let HomeViewController = segue.destination as? HomeViewController else {return}
        HomeViewController.user = self.temp

    }
}
