//
//  OffersViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/30/21.
//

import UIKit

class OffersViewController: UIViewController {
    var tapOne = false
    var tapTwo = false
    var tapThree = false
    var tapFour = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func viewOfferOne(_ sender: UIButton) {
        tapOne = !tapOne
        if tapOne {
            sender.setTitle("Use Code DWHSXY18 at Checkout", for: .normal)
        } else {
            sender.setTitle("Tap for a 10% Reservation Discount", for: .normal)
        }
    }
    
    @IBAction func viewOfferTwo(_ sender: UIButton) {
       tapTwo = !tapTwo
        if tapTwo {
            sender.setTitle("Use Code DF76W8FX at Checkout", for: .normal)
        } else {
            sender.setTitle("Tap for a 20% Off Gym Subscription", for: .normal)
        }
    }
    
    @IBAction func viewOfferThree(_ sender: UIButton) {
        tapThree = !tapThree
        if tapThree {
            sender.setTitle("Use Code KJEEJ7Y6 at Checkout", for: .normal)
        } else {
            sender.setTitle("Tap for $50 Off Next Meal Worth $200+", for: .normal)
        }
    }
    
    @IBAction func viewOfferFour(_ sender: UIButton) {
        tapFour = !tapFour
        if tapFour {
            sender.setTitle("Use Code Z3GJDJ5D at Checkout", for: .normal)
        } else {
            sender.setTitle("Tap for $30 Hot Tub Reservation", for: .normal)
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
