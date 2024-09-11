//
//  Cart+CoreDataProperties.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "CartItems")
    }

    @NSManaged public var courseDescription: String?
    @NSManaged public var courseId: String?
    @NSManaged public var courseImage: Data?
    @NSManaged public var courseName: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var quantity: String?

}

extension Cart : Identifiable {

}
