//
//  FunctionView.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/16/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class tkFunctionView: knView {
    let addButton = knUIMaker.makeButton()
    let listOptionButton = knUIMaker.makeButton(image: UIImage(named: "dot_menu"))
    let accountOptionButton = knUIMaker.makeButton(image: UIImage(named: "dash_menu"))
    
    override func setupView() {
        let plusIcon = knUIMaker.makeImageView(image: UIImage(named: "add")!,
                                               contentMode: .scaleAspectFit)
        plusIcon.change(color: .white)
        let addLabel = knUIMaker.makeLabel(text: "Add a new task",
                                           font: .boldSystemFont(ofSize: 16),
                                           color: .white)
        let addView = knUIMaker.makeView()
        addView.addSubviews(views: plusIcon, addLabel)
        addView.addConstraints(withFormat: "H:|[v0]-16-[v1]|",
                               views: plusIcon, addLabel)
        plusIcon.centerY(toView: addView)
        addLabel.centerY(toView: addView)
        
        addButton.addSubviews(views: addView)
        addView.center(toView: addButton)
        addButton.createRoundCorner(30)
        addButton.backgroundColor = UIColor.color(r: 71, g: 136, b: 241)
        
        let line = knUIMaker.makeLine(color: .color(value: 234), height: 3)
        addSubviews(views: line, addButton, listOptionButton, accountOptionButton)
        
        line.horizontal(toView: self)
        line.centerY(toView: addButton)
        
        addButton.top(toView: self)
        addButton.centerX(toView: self)
        addButton.size(CGSize(width: screenWidth / 1.8, height: 60))
        
        
        listOptionButton.right(toView: self, space: -24)
        listOptionButton.verticalSpacing(toView: addButton)
        
        accountOptionButton.left(toView: self, space: 24)
        accountOptionButton.verticalSpacing(toView: addButton)
    }
}
