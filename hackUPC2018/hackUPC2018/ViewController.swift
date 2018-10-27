//
//  ViewController.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 20/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkDataManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    var courses : Array<CourseModel>!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenCourseCell", for: indexPath) as! MainScreenCourseCell
        
        cell.backgroundColor = UIColor.clear
    
        cell.addContentVC(contentVC: storyboard?.instantiateViewController(withIdentifier: "CardContent"), fromVC: self)
        cell.title = self.courses[indexPath.row].title
        cell.itemSubtitle = self.courses[indexPath.row].startDate
        cell.itemTitle = self.courses[indexPath.row].courseDescription
        
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
         cell.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.startPoint = CGPoint.init(x: 0, y: 0)
        gradient.endPoint = CGPoint.init(x: 1, y: 1)
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor];
        
        self.backgroundView.layer.addSublayer(gradient)
        
        self.tableView.register(MainScreenCourseCell.self, forCellReuseIdentifier: "MainScreenCourseCell")
        
        let manager = NetworkDataManager.init()
        self.courses = [];
        
        for index in 0...3 {
            manager.loadCourse(index)
        }
        
    }

    func networkDataManagerDidLoad(course: CourseModel) {
       
        for loadedCourse in self.courses
        {
            if (loadedCourse.isEqualCourses(course)) {
                let index = self.courses.firstIndex(of: loadedCourse)!
                self.courses.remove(at: index)
                self.courses.insert(course, at: index)
            } else {
                self.courses.append(course)
            }
        }
        
        self.tableView.reloadData()
    }
    
    func networkDataManagerDidEndWith(error: String) {
        
    }
    
}

