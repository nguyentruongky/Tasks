//
//  CreateTaskView.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/16/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class tkCreateTaskView: knView {
    let textField = knUIMaker.makeTextField(placeholder: "New task",
                                            font: .systemFont(ofSize: 18),
                                            color: .black)
    let addButton = knUIMaker.makeButton(image: UIImage(named: "add_fill"))
    let saveButton = knUIMaker.makeButton(title: "Save",
                                          titleColor: UIColor.color(r: 68, g: 137, b: 242),
                                          font: .boldSystemFont(ofSize: 18))
    var officalBounds = CGRect.zero
    
    override func setupView() {
        addSubviews(views: textField, addButton, saveButton)
        
        textField.horizontal(toView: self, space: 24)
        textField.top(toView: self, space: 16)
        
        addButton.bottomLeft(toView: self, bottom: -16, left: 24)
        addButton.square(edge: 44)
        
        saveButton.right(toView: self, space: -24)
        saveButton.centerY(toView: addButton)
        
        textField.height(44)
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        guard officalBounds != bounds else { return }
        officalBounds = bounds
        makeBorder()
    }
    
    func makeBorder() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topRight, .topLeft],
                                    cornerRadii: CGSize(width: 20, height: 20))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
}
