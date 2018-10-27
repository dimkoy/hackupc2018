//
//  NetworkDataManager.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 26/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkDataManagerDelegate {
    func networkDataManagerDidLoad(course:CourseModel)
    func networkDataManagerDidEndWith(error:String)
}

class NetworkDataManager: NSObject {
    
    var delegate : NetworkDataManagerDelegate?
 
    func loadCourse(_ courseId:Int) {
        Alamofire.request("http://35.204.155.78:7000/courses/\(courseId)/").responseJSON { response in
            
            guard response.result.isSuccess else {
                print("Response is failure")
                return
            }
            
            let json = JSON(response.result.value ?? nil!)
            
            if json.error != nil {
                print("JSON Convert error: \(String(describing: json.error))")
            } else {
                // convert here
            }
            
            print (json)
            
            let course = CourseModel()
            
           
            course.courseId = json["id"].intValue
            course.title = json["title"].stringValue
            course.keyword = json["startDate"].stringValue
            course.duration = json["duration"].intValue
            course.courseDescription = json["description"].stringValue
            
            self.delegate?.networkDataManagerDidLoad(course: course)
        }
    }
}
