//
//  MainScreenCourseCell.swift
//  hackUPC2018
//
//  Created by Дмитрий Червяков on 20/10/2018.
//  Copyright © 2018 Дмитрий Червяков. All rights reserved.
//

import UIKit
import Cards

class MainScreenCourseCell: UITableViewCell {
    
    var card : CardHighlight!
    var title: String {
        get {
            return self.card.title
        }
        set {
            self.card.title = newValue
        }
    }
    
    var itemTitle: String {
        get {
            return self.card.itemTitle
        }
        set {
            self.card.itemTitle = newValue
        }
    }
    
    var itemSubtitle: String {
        get {
            return self.card.itemSubtitle
        }
        set {
            self.card.itemSubtitle = newValue
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        card = CardHighlight(frame: CGRect(x: 15, y: 20, width: UIScreen.main.bounds.width - 30 , height: 240))
        card.backgroundColor = UIColor(red: 0, green: 94/255, blue: 200/255, alpha: 1)
        card.icon = UIImage(named: "background")
        card.title = "Photoshop \nFor \nSmm"
        card.itemTitle = "Video course"
        card.itemSubtitle = "Extended course"
        card.textColor = UIColor.white

        card.hasParallax = false

        self.contentView.addSubview(card)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        card.removeFromSuperview()
    }
    
    func addContentVC(contentVC:UIViewController?, fromVC:UIViewController) {
        card.shouldPresent(contentVC, from:fromVC, fullscreen:  false)
    }
}
