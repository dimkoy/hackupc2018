//
//  CourseModel.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 20/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import Foundation

class CourseModel: NSObject {
    
    var title:String! = nil
    var courseDescription:String! = nil
    var priceValue:Int = 0
    var courseId:Int = 0
    var keyword:String! = nil
    var startDate:String! = nil
    var duration:Int = 0
    
    public func isEqualCourses(_ object: CourseModel) -> Bool {
        if self.courseId == object.courseId {
            return true
        }
        
        return false
    }
}
