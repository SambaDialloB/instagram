//
//  LoginViewController.swift
//  Instagram
//
//  Created by Samba on 2/21/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var uTextField: UITextField!

    
    @IBOutlet weak var pTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: uTextField.text!, password: pTextField.text!, block: { (user, error) -> Void in
//        PFUser.logInWithUsername(inBackground: uTextField.text!, password: pTextField.text!) block{ (user: PFUser?,error: NSError? ) ->Void in
            if(user != nil){
                print("logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
        })
    }
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = uTextField.text
        newUser.password = pTextField.text
        newUser.signUpInBackground(block: { (success, error) -> Void in
            if success {
                print("liiiiiiit made a user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription as Any)
            }
        })
            
//            selector: newUser.signUpInBackground block: { (success: Bool,error: NSError? ) -> Void in
//            if success {
//                print("liiiiiiit made a user")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }else{
//                print(error?.localizedDescription)
//            }
//            } as! PFBooleanResultBlock
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

}
