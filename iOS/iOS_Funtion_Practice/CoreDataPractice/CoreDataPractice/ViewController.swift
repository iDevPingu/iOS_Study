//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Ick on 2021/04/12.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        
        let entity = NSEntityDescription.entity(forEntityName: "PhoneBook", in: self.container.viewContext)

        if let entity = entity {

            let person = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
            person.setValue("잘 저장 될까", forKey: "memo")
            person.setValue("Pingu", forKey: "personName")
            person.setValue("010-0000-0000", forKey: "phoneNumber")

            do {
                try self.container.viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        self.fetchContact()
    }
    
    func fetchContact() {
        do {
            let contact = try self.container.viewContext.fetch(PhoneBook.fetchRequest()) as! [PhoneBook]
            contact.forEach {
                print($0.personName)
                print($0.phoneNumber)
                print($0.memo)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}

struct Person {
    var memo: String?
    var personName: String?
    var phoneNumber: String?
}
