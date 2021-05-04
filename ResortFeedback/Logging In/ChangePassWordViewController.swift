//
//  ChangePassWordViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import UIKit

class ChangePassWordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userF: UITextField!
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var confirmNewPass: UITextField!
    @IBOutlet weak var updatePass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userF.delegate = self
        newPass.delegate = self
        confirmNewPass.delegate = self
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        updatePass.layer.borderWidth = 4
        updatePass.layer.cornerRadius = 10.0
        updatePass.layer.cornerCurve = .continuous
    }
    

    @IBAction func updatePassWord(_ sender: Any) {
        if (newPass.text == confirmNewPass.text) { // User has confirmed their password and they match, so continue
            let updatedPass = confirmNewPass.text
            let dic = ["username" : userF.text, "password":updatedPass]
            DBHelper.inst.updatePassword(object: dic as! [String:String])
            userF.text = ""
            newPass.text = ""
            confirmNewPass.text = ""
        } else {
            print("Passwords do not match. Please confirm your new password again.")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
