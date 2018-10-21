//
//  ViewController.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 20/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    var courses : Array<Any>? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenCourseCell", for: indexPath) as! MainScreenCourseCell
        
        cell.backgroundColor = UIColor.clear
    
        cell.fillWith("date")
        cell.addContentVC(contentVC: storyboard?.instantiateViewController(withIdentifier: "CardContent"), fromVC: self)
        
        
        cell.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
    }


}

