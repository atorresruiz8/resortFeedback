//
//  WelcomeViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 5/4/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    var position = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // animates the logo to rise up to the center of the screen in 1 second, before allowing the user to transition to the next view controller
        animateLogo()
        
        // Loads the view controller containing the sign in screen after 5 seconds
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(loadSignInVC), userInfo: nil, repeats: false)
    }

    
    @objc func loadSignInVC() { // instantiates the view controller containing the sign in screen
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        self.present(myVC, animated: true, completion: nil)
    }
    
    func animateLogo() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateLogo), userInfo: nil, repeats: true)
    }
    
    @objc func updateLogo() {
        switch position { // cycles between different positions in the animation loop
            case 0:
                let anim = UIViewPropertyAnimator(duration: 1.0, curve: .linear) { // moves the logo upwards for 2 seconds
                    self.logo.center.y -= 175
                }
                
                anim.startAnimation()
                position = 1
            case 1:
                UIView.animate(withDuration: 1.0, animations: { // rotates the logo 180 degrees
                    self.logo.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
                })
                position = 2
            case 2:
                UIView.animate(withDuration: 1.0, animations: { // rotates the logo 360 degrees
                    self.logo.transform = CGAffineTransform(rotationAngle: (360.0 * .pi) / 180.0)
                })
            default:
                print("")
        }
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
