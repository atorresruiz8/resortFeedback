//
//  OverallViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//

import UIKit

class OverallViewController: UIViewController {

    // used for storing the ratings for this specific user, to calculate their average score
    var ratingArr : [Double] = []
    
    // outlets used to reference each rating bar the user can interact with
    @IBOutlet weak var ratingOne: CosmosView!
    @IBOutlet weak var ratingTwo: CosmosView!
    @IBOutlet weak var ratingThree: CosmosView!
    @IBOutlet weak var ratingFour: CosmosView!
    @IBOutlet weak var ratingFive: CosmosView!
    
    @IBOutlet weak var submitOverall: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateRatingOne()
        
        updateRatingTwo()
        
        updateRatingThree()
        
        updateRatingFour()
        
        updateRatingFive()
        
        // these following lines are used to create a rounded button effect, with a border width of 4 pixels, corner radius of 10 pixels, continuous corner curve and a default border color of black
        submitOverall.layer.borderWidth = 4
        submitOverall.layer.cornerRadius = 10.0
        submitOverall.layer.cornerCurve = .continuous
    }
    
    func updateRatingOne() { // function used to update and store information relevant to the user's responses to question 1
        ratingOne.settings.fillMode = .full
        ratingOne.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addOverallReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingTwo() { // function used to update and store information relevant to the user's responses to question 2
        ratingTwo.settings.fillMode = .full
        ratingTwo.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addOverallReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingThree() { // function used to update and store information relevant to the user's responses to question 3
        ratingThree.settings.fillMode = .full
        ratingThree.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addOverallReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingFour() { // function used to update and store information relevant to the user's responses to question 4
        ratingFour.settings.fillMode = .full
        ratingFour.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addOverallReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    func updateRatingFive() { // function used to update and store information relevant to the user's responses to question 5
        ratingFive.settings.fillMode = .full
        ratingFive.didFinishTouchingCosmos = {
            rate in
            DBHelper.inst.addOverallReview(rating: rate)
            self.ratingArr.append(rate)
        }
    }
    
    @IBAction func calcAvg(_ sender: Any) {
        let sumArray = ratingArr.reduce(0, +) // reduces the array, one entry at a time and adds the values along the way
        let avg = sumArray / Double(ratingArr.count) // take the average to find the average score the user gave for this survey
        print("Average score from this user is:", avg)
        
        if (avg >= 2.5) { // If the user's average score is 2.5 or greater, present them with a thank you screen before allowing them to return to the login menu
            let thankYou = self.storyboard?.instantiateViewController(withIdentifier: "thanks") as! ThankYouScreenViewController
            thankYou.modalPresentationStyle = .fullScreen
            self.present(thankYou, animated: true, completion: nil)
        } else if (avg < 2.5) { // If the user's average is below a 2.5, present them with a screen apologizing for the service before allowing them to return to the login menu
            let badReview = self.storyboard?.instantiateViewController(withIdentifier: "badreview") as! PoorReviewViewController
            badReview.modalPresentationStyle = .fullScreen
            self.present(badReview, animated: true, completion: nil)
        } else if (avg.isNaN) { // user did not enter anything into the survey, try again
            let redo = self.storyboard?.instantiateViewController(withIdentifier: "redo") as! RedoSurveyViewController
            redo.modalPresentationStyle = .fullScreen
            self.present(redo, animated: true, completion: nil)
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
