//
//  ViewController.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 20/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.startPoint = CGPoint.init(x: 0, y: 0)
        gradient.endPoint = CGPoint.init(x: 1, y: 1)
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor];
        
        self.view.layer.addSublayer(gradient)
    }


}

