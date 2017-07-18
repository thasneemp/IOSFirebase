//
//  RegisterViewController.swift
//  FirbaseWalkTrough
//
//  Created by Muhammed Thasneem on 15/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func registerAtion(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if user?.uid == nil {
                print("User not registred")
            }else {
                print("User Registerd : " + (user?.uid)!)
                
                let userInfo = ["name":self.nameTextField.text, "email" : self.emailTextField.text]
                
                self.ref.child("users").child((user?.uid)!).setValue(userInfo)
            }
        }
    }

}
