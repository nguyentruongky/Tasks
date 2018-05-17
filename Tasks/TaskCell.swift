//
//  TaskCell.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/17/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit
class tkTask {
    var name: String?
    var finish = false
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}

class tkTaskCell: knTableCell {
    
    var data: tkTask? {
        didSet {
            guard let data = data else { return }
            nameLabel.text = data.name
        }
    }
    
    let doneButton = knUIMaker.makeButton()
    let nameLabel = knUIMaker.makeLabel(font: .systemFont(ofSize: 16),
                                        color: .black,
                                        numberOfLines: 0)
    
    override func setupView() {
        let line = knUIMaker.makeLine(color: UIColor.color(value: 230), height: 1)
        addSubviews(views: doneButton, nameLabel, line)
        
        doneButton.left(toView: self, space: 24)
        doneButton.centerY(toView: nameLabel)
        
        nameLabel.vertical(toView: self, space: 24)
        nameLabel.leftHorizontalSpacing(toView: doneButton, space: -24)
        nameLabel.right(toView: self, space: -24)
        
        line.horizontal(toView: self)
        line.bottom(toView: self)
        
        doneButton.createBorder(2, color: UIColor.color(value: 110))
        doneButton.square(edge: 24)
        doneButton.createRoundCorner(12)
    }
}


