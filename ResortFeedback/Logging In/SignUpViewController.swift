//
//  SignUpViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userAlreadyExists: UILabel!
    @IBOutlet weak var userT: UITextField!
    @IBOutlet weak var passT: UITextField!
    @IBOutlet weak var createAcc: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userT.delegate = self
        passT.delegate = self
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        createAcc.layer.borderWidth = 4
        createAcc.layer.cornerRadius = 10.0
        createAcc.layer.cornerCurve = .continuous
        
        // by default, do not show the error that the user already exists
        userAlreadyExists.isHidden = true
    }
    

    @IBAction func createNewUser(_ sender: Any) {
        let data = DBHelper.inst.getData()
        for g in data {
            if (userT.text != g.username!) { // if username doesn't exist in core data, allow them to create user
                let dic = ["username" : userT.text, "password" : passT.text]
                DBHelper.inst.addData(object: dic as! [String:String])
            } else if (userT.text == g.username!) { // if username does exist in core data, present a warning
                userAlreadyExists.isHidden = false
                
            }
        }
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
