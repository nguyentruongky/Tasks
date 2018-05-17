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
    let addButton = knUIMaker.makeButton(image: UIImage(named: "add_fill")?.changeColor())
    let saveButton = knUIMaker.makeButton(title: "Save",
                                          titleColor: UIColor.color(r: 68, g: 137, b: 242),
                                          font: .boldSystemFont(ofSize: 18))
    let detailButton = knUIMaker.makeButton(image: UIImage(named: "detail"))
    let calendarButton = knUIMaker.makeButton(image: UIImage(named: "event"))
    var officalBounds = CGRect.zero
    
    override func setupView() {
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        
        addSubviews(views: textField, addButton, saveButton, detailButton, calendarButton)
        
        textField.horizontal(toView: self, space: 24)
        textField.top(toView: self, space: 16)
        
        addButton.bottomLeft(toView: self, bottom: -16, left: 18)
        addButton.square(edge: 44)
        
        detailButton.fill(toView: addButton)
        calendarButton.fill(toView: addButton)
        
        detailButton.alpha = 0
        calendarButton.alpha = 0
        
        saveButton.right(toView: self, space: -24)
        saveButton.centerY(toView: addButton)
        
        textField.height(44)
        backgroundColor = .white
        
        addButton.addTarget(self, action: #selector(showTaskOption))
        addButton.tintColor = UIColor.color(r: 71, g: 136, b: 241)
        
    }
    

    
    var taskOptionShown = false
    
    @objc func showTaskOption() {
        if taskOptionShown == false {
            changeAddButtonColor(UIColor.color(r: 96, g: 99, b: 104))
            addButton.animateRotation(angle: CGFloat.pi / 4)
            animateDetailButton(visible: true)
            animateCalendarButton(visible: true)
        }
        else {
            changeAddButtonColor(UIColor.color(r: 71, g: 136, b: 241))
            addButton.animateRotation(angle: -CGFloat.pi / 4)
            animateDetailButton(visible: false)
            animateCalendarButton(visible: false)
        }
        addButton.animateZooming()
        taskOptionShown = !taskOptionShown
    }
    
    func changeAddButtonColor(_ color: UIColor) {
        addButton.tintColor = color
    }
    
    func animateDetailButton(visible: Bool) {
        let xPos = detailButton.center.x + 8 * (visible ? 1 : -1)
        let alpha: CGFloat = visible ? 1 : 0
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let detailButton = self?.detailButton else { return }
            detailButton.transform = CGAffineTransform(translationX: xPos, y: 0)
            detailButton.alpha = alpha
        })
    }
    
    func animateCalendarButton(visible: Bool) {
        let xPos = detailButton.center.x + 64 * (visible ? 1 : -1)
        let alpha: CGFloat = visible ? 1 : 0
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let calendarButton = self?.calendarButton else { return }
            calendarButton.transform = CGAffineTransform(translationX: xPos, y: 0)
            calendarButton.alpha = alpha
        })
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
