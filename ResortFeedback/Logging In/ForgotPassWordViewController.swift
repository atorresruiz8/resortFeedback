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
    @IBOutlet weak var requestPass: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userF.delegate = self
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        requestPass.layer.borderWidth = 4
        requestPass.layer.cornerRadius = 10.0
        requestPass.layer.cornerCurve = .continuous
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
