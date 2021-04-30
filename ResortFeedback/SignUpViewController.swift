//
//  SignUpViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userT: UITextField!
    @IBOutlet weak var passT: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userT.delegate = self
        passT.delegate = self
    }
    

    @IBAction func createNewUser(_ sender: Any) {
        let dic = ["username" : userT.text, "password" : passT.text]
        DBHelper.inst.addData(object: dic as! [String:String])
        userT.text = "" // reset the text fields to empty so the user can create another new user if they wish
        passT.text = ""
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
