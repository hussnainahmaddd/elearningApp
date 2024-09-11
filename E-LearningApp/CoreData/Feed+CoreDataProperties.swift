//
//  Feed+CoreDataProperties.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//
//

import Foundation
import CoreData


extension Feed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feed> {
        return NSFetchRequest<Feed>(entityName: "Feed")
    }

    @NSManaged public var course: String?
    @NSManaged public var courseDescription: String?
    @NSManaged public var courseImage: Data?
    @NSManaged public var courseName: String?
    @NSManaged public var coursePrice: String?

}

extension Feed : Identifiable {

}
