//
//  DBHelper.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/19/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper {
    static var inst = DBHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addData(object : [String:String]) { // adds username and login to the core data
        let guest = NSEntityDescription.insertNewObject(forEntityName: "Guest", into: context!) as! Guest
        guest.username = object["username"]
        guest.password = object["password"]
        
        do {
            try context?.save()
            print("User created with username:", guest.username!, "and password:", guest.password!)
        } catch {
            print("data not saved")
        }
    }
    
    func addRoomReview(rating : Double) { // adds the rating to the core data
        let rr = NSEntityDescription.insertNewObject(forEntityName: "Room", into: context!) as! Room
        rr.rating = rating

        do {
            try context?.save()
            print("User rated this question as:", rr.rating)
        } catch {
            print("data not saved")
        }
    }
    
    func addFoodReview(rating : Double) { // adds the rating to the core data
        let fr = NSEntityDescription.insertNewObject(forEntityName: "Food", into: context!) as! Food
        fr.rating = rating

        do {
            try context?.save()
            print("User rated this question as:", fr.rating)
        } catch {
            print("data not saved")
        }
    }
    
    func addGymReview(rating : Double) { // adds the rating to the core data
        let gr = NSEntityDescription.insertNewObject(forEntityName: "Gym", into: context!) as! Gym
        gr.rating = rating

        do {
            try context?.save()
            print("User rated this question as:", gr.rating)
        } catch {
            print("data not saved")
        }
    }
    
    func addSpaReview(rating : Double) { // adds the rating to the core data
        let sr = NSEntityDescription.insertNewObject(forEntityName: "Spa", into: context!) as! Spa
        sr.rating = rating

        do {
            try context?.save()
            print("User rated this question as:", sr.rating)
        } catch {
            print("data not saved")
        }
    }
    
    func addOverallReview(rating : Double) { // adds the rating to the core data
        let or = NSEntityDescription.insertNewObject(forEntityName: "Overall", into: context!) as! Overall
        or.rating = rating

        do {
            try context?.save()
            print("User rated this question as:", or.rating)
        } catch {
            print("data not saved")
        }
    }
    
    func getData()->[Guest] { // print the entire database for every guest
        var g = [Guest]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Guest")
        do {
            g = try context?.fetch(fetchReq) as! [Guest]
        } catch {
            print("Could not find user.")
        }
        
        return g
    }
    
    func getRoomReview()->[Room] { // print the entire database for every rating
        var rr = [Room]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Room")
        do {
            rr = try context?.fetch(fetchReq) as! [Room]
        } catch {
            print("Could not find user.")
        }

        return rr
    }
    
    func getFoodReview()->[Food] { // print the entire database for every rating
        var fr = [Food]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Food")
        do {
            fr = try context?.fetch(fetchReq) as! [Food]
        } catch {
            print("Could not find user.")
        }

        return fr
    }
    
    func getGymReview()->[Gym] { // print the entire database for every rating
        var gr = [Gym]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Gym")
        do {
            gr = try context?.fetch(fetchReq) as! [Gym]
        } catch {
            print("Could not find user.")
        }

        return gr
    }
    
    func getSpaReview()->[Spa] { // print the entire database for every rating
        var sr = [Spa]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Spa")
        do {
            sr = try context?.fetch(fetchReq) as! [Spa]
        } catch {
            print("Could not find user.")
        }

        return sr
    }
    
    func getOverallReview()->[Overall] { // print the entire database for every rating
        var or = [Overall]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Overall")
        do {
            or = try context?.fetch(fetchReq) as! [Overall]
        } catch {
            print("Could not find user.")
        }

        return or
    }
    
    func getOneGuest(username : String)->Guest {
        var g = Guest()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Guest")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [Guest]
            if (req.count != 0) {
                g = req.first as! Guest
            } else {
                print("Username or password not found.")
            }
        } catch {
            print("")
        }
        
        return g
    }
    
    func updatePassword(object : [String:String]) { // updates the old password to a new one created by the user
        var g = Guest()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Guest")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["username"]!)
        do {
            let gu = try context?.fetch(fetchReq)
            
            if (gu?.count != 0) {
                g = gu?.first as! Guest
                g.password = object["password"]
                try context?.save()
                print("Your new password is created, it is:", g.password!)
            }
        } catch {
            print("Error")
        }
    }
    
    func wipeClean() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Guest")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func wipeRoomReview() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Room")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func wipeFoodReview() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Food")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func wipeGymReview() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Gym")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func wipeSpaReview() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Spa")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func wipeOverallReview() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Overall")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
}
