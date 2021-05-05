//
//  ViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { // TextFieldDelegate is used to declare the function for pushing a key to exit keyboard input
    let ud = UserDefaults.standard // Used to store the user's default login information
    let uds = UserDefaults.standard // Used to store the user's default switch state
    
    // Outlets used to check the input/state of the "remember me" switch and the username/password text fields
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    // Outlets used for referencing to create rounded buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAcc: UIButton!
    @IBOutlet weak var forgotPass: UIButton!
    @IBOutlet weak var changePass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // these delegates are used in conjunction with textFieldShouldReturn to allow the user to exit touch screen keyboard input by pushing the return key
        userName.delegate = self
        passWord.delegate = self
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        loginButton.layer.borderWidth = 4
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.cornerCurve = .continuous
        
        createAcc.layer.borderWidth = 4
        createAcc.layer.cornerRadius = 10.0
        createAcc.layer.cornerCurve = .continuous
        
        forgotPass.layer.borderWidth = 4
        forgotPass.layer.cornerRadius = 10.0
        forgotPass.layer.cornerCurve = .continuous
        
        changePass.layer.borderWidth = 4
        changePass.layer.cornerRadius = 10.0
        changePass.layer.cornerCurve = .continuous
        
        if (sw.isOn) { // if the switch is on, remember the last username/password combo entered and automatically enter it for the user
            userName.text = ud.string(forKey: "username")
            passWord.text = ud.string(forKey: "password")
        }
    }

    @IBAction func signIn(_ sender: Any) { // this function verifies if the entered username and password match values stored in the coredata
//        if (userName.text == "admin" && passWord.text == "admin") { // for my testing purposes, this login presents me an admin page where I can easily view what is in the CoreData for each entity and delete them if needed
//            let adminPage = self.storyboard?.instantiateViewController(withIdentifier: "admin") as! AdminViewController
//            adminPage.modalPresentationStyle = .fullScreen
//            self.present(adminPage, animated: true, completion: nil)
//        }
        // admin login page was removed upon finishing project. it was merely a collection of buttons that would run view all and delete all functions on each Core Data entity
        
        let data = DBHelper.inst.getData()
        for g in data {
            if (userName.text == g.username! && passWord.text == g.password!) { // username and password are in core data, let the user sign in
                let signIn = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LogInMenuViewController
                signIn.modalPresentationStyle = .fullScreen
                self.present(signIn, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func signUp(_ sender: UIButton) { // this creates a new key-value pair that stores the user's login info by taking them to a new screen
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
        signUp.modalPresentationStyle = .fullScreen
        self.present(signUp, animated: true, completion: nil)
    }
    
    
    @IBAction func updatePassWord(_ sender: Any) { // this allows the user to change/update their password by taking them to a new screen
        let change = self.storyboard?.instantiateViewController(withIdentifier: "change") as! ChangePassWordViewController
        change.modalPresentationStyle = .fullScreen
        self.present(change, animated: true, completion: nil)
    }
    
    
    @IBAction func rememberPassWord(_ sender: UISwitch) { // this allows the program to store and auto print the user's login info should they allow the program to do so. this is done using userdefault
        if (sw.isOn) {
            uds.set(sender.isOn, forKey: "mySwitchValue") // Stores the selected value for the switch as a default
            ud.set(userName.text, forKey: "username") // Stores the username and password to automatically log in once again
            ud.set(passWord.text, forKey: "password")
        } else {
            ud.removeObject(forKey: "username") // Switch is turned off, delete the stored username and password
            ud.removeObject(forKey: "password")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sw.isOn = uds.bool(forKey: "mySwitchValue") // Make the switch react to the last state it had in the defaults
        userName.text = ud.string(forKey: "username") // print the username and password if the switch is on
        passWord.text = ud.string(forKey: "password")
    }
    
    @IBAction func forgotPassWord(_ sender: Any) { // this allows the user to reset their password if they forgot it. first checks to see if the username is in the coredata. brings up a new screen
        let forgot = self.storyboard?.instantiateViewController(withIdentifier: "forgot") as! ForgotPassWordViewController
        forgot.modalPresentationStyle = .fullScreen
        self.present(forgot, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // used to make it so the user can push the return key on the keyboard to exit out of keyboard input
        textField.resignFirstResponder()
        return true
    }

}
