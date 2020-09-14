//
//  DayOfTheWeek+CoreDataProperties.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//
//

import Foundation
import CoreData


extension DayOfTheWeek {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayOfTheWeek> {
        return NSFetchRequest<DayOfTheWeek>(entityName: "DayOfTheWeek")
    }

    @NSManaged public var dayName: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension DayOfTheWeek {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}
