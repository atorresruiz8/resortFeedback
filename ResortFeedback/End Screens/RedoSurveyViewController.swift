//
//  RedoSurveyViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/29/21.
//

import UIKit
// source: https://github.com/swiftgif/SwiftGif
import SwiftGifOrigin
// SwiftGifOrigin pod is used for importing gifs into UIImageView outlets

class RedoSurveyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // this line imports a gif into an image view and displays it to the user
        imageView.image = UIImage.gif(asset: "confused")
        
        // Loads the view controller containing the sign in screen after 5 seconds
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(loadLogInMenuVC), userInfo: nil, repeats: false)
    }

    
    @objc func loadLogInMenuVC() { // instantiates the view controller containing the sign in screen
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LogInMenuViewController
        myVC.modalPresentationStyle = .fullScreen
        self.present(myVC, animated: true, completion: nil)
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
