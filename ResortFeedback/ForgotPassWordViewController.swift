//
//  ForgotPassWordViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import UIKit

class ForgotPassWordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userF: UITextField!
    @IBOutlet weak var passDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userF.delegate = self
    }
    
    @IBAction func forgotPassWord(_ sender: Any) {
        let data = DBHelper.inst.getOneGuest(username: userF.text!)
        passDisplay.text = data.password!
        print("For", data.username!, "your password is:", data.password!)
        userF.text = ""
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
