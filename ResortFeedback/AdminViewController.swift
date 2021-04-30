//
//  AdminViewController.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//

import UIKit

class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        DBHelper.inst.wipeClean()
    }

    @IBAction func viewAll(_ sender: Any) {
        let data = DBHelper.inst.getData()
        var i = 1
        for g in data {
            print("\(i).", "Username:", g.username!, "Password:", g.password!)
            i += 1
        }
    }
    
    @IBAction func deleteRoomRatings(_ sender: Any) {
        DBHelper.inst.wipeRoomReview()
    }
    
    @IBAction func deleteFoodRatings(_ sender: Any) {
        DBHelper.inst.wipeFoodReview()
    }
    
    @IBAction func deleteGymRatings(_ sender: Any) {
        DBHelper.inst.wipeGymReview()
    }
    
    @IBAction func deleteSpaRatings(_ sender: Any) {
        DBHelper.inst.wipeSpaReview()
    }
    
    @IBAction func deleteOverallRatings(_ sender: Any) {
        DBHelper.inst.wipeOverallReview()
    }
    
    
    @IBAction func viewRoomRatings(_ sender: Any) {
        let data = DBHelper.inst.getRoomReview()
        var i = 1
        for r in data {
            print("\(i).", "User rated this as:", r.rating)
            i += 1
        }
    }
    
    @IBAction func viewFoodRatings(_ sender: Any) {
        let data = DBHelper.inst.getFoodReview()
        var i = 1
        for f in data {
            print("\(i).", "User rated this as:", f.rating)
            i += 1
        }
    }
    
    @IBAction func viewGymRatings(_ sender: Any) {
        let data = DBHelper.inst.getGymReview()
        var i = 1
        for g in data {
            print("\(i).", "User rated this as:", g.rating)
            i += 1
        }
    }
    
    @IBAction func viewSpaRatings(_ sender: Any) {
        let data = DBHelper.inst.getSpaReview()
        var i = 1
        for s in data {
            print("\(i).", "User rated this as:", s.rating)
            i += 1
        }
    }
    
    @IBAction func viewOverallRatings(_ sender: Any) {
        let data = DBHelper.inst.getOverallReview()
        var i = 1
        for o in data {
            print("\(i).", "User rated this as:", o.rating)
            i += 1
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
