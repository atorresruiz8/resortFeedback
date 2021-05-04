//
//  LogInMenuViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/20/21.
//

import UIKit

class LogInMenuViewController: UIViewController {

    @IBOutlet weak var survey: UIButton!
    @IBOutlet weak var viewOffers: UIButton!
    @IBOutlet weak var logOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        survey.layer.borderWidth = 4
        survey.layer.cornerRadius = 10.0
        survey.layer.cornerCurve = .continuous
        
        viewOffers.layer.borderWidth = 4
        viewOffers.layer.cornerRadius = 10.0
        viewOffers.layer.cornerCurve = .continuous
        
        logOut.layer.borderWidth = 4
        logOut.layer.cornerRadius = 10.0
        logOut.layer.cornerCurve = .continuous
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
