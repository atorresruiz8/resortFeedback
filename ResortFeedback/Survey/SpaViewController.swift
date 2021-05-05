//
//  SpaViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//

import UIKit

class SpaViewController: UIViewController {

    // used for storing the ratings for this specific user, to calculate their average score
    var ratingArr : [Double] = []
    
    // outlets used to reference each rating bar the user can interact with
    @IBOutlet weak var ratingOne: CosmosView!
    @IBOutlet weak var ratingTwo: CosmosView!
    @IBOutlet weak var ratingThree: CosmosView!
    @IBOutlet weak var ratingFour: CosmosView!
    @IBOutlet weak var ratingFive: CosmosView!
    
    @IBOutlet weak var submitSpa: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateRatingOne()
        
        updateRatingTwo()
        
        updateRatingThree()
        
        updateRatingFour()
        
        updateRatingFive()
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        submitSpa.layer.borderWidth = 4
        submitSpa.layer.cornerRadius = 10.0
        submitSpa.layer.cornerCurve = .continuous
    }
    
    func updateRatingOne() { // function used to update and store information relevant to the user's responses to question 1
        ratingOne.settings.fillMode = .full
        ratingOne.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addSpaReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingTwo() { // function used to update and store information relevant to the user's responses to question 2
        ratingTwo.settings.fillMode = .full
        ratingTwo.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addSpaReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingThree() { // function used to update and store information relevant to the user's responses to question 3
        ratingThree.settings.fillMode = .full
        ratingThree.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addSpaReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingFour() { // function used to update and store information relevant to the user's responses to question 4
        ratingFour.settings.fillMode = .full
        ratingFour.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addSpaReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingFive() { // function used to update and store information relevant to the user's responses to question 5
        ratingFive.settings.fillMode = .full
        ratingFive.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addSpaReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    @IBAction func calcAvg(_ sender: Any) { // this is mostly for testing purposes for me to verify that data is properly being passed along between view controllers
        let sumArray = ratingArr.reduce(0, +) // reduces the array, one entry at a time and adds the values along the way
        let avg = sumArray / Double(ratingArr.count) // take the average to find the average score the user gave for this survey
        print("Average score from this user is so far is:", avg)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // this function is used to pass along data to the next screen in the survey
        if segue.destination is OverallViewController {
            let vc = segue.destination as? OverallViewController
            vc?.ratingArr = ratingArr
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
