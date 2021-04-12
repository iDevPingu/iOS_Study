//
//  PhoneBook+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Ick on 2021/04/12.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var memo: String?
    @NSManaged public var personName: String?
    @NSManaged public var phoneNumber: String?

}

extension PhoneBook : Identifiable {

}
