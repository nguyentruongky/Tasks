//
//  ViewController.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/15/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class ViewController: knController {
    let titleLabel = knUIMaker.makeLabel(text: "My Tasks",
                                         font: UIFont.systemFont(ofSize: 36),
                                         color: .black)
    let stateView = tkStateView()
    let functionView = tkFunctionView()
    let newTaskView: tkCreateTaskView = {
        let view = tkCreateTaskView()
        view.frame.size = CGSize(width: screenWidth, height: 130)
        view.alpha = 0
        return view
    }()
    
    override var inputAccessoryView: UIView? { return newTaskView }
    override var canBecomeFirstResponder: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func setupView() {
        view.addSubviews(views: titleLabel, stateView, functionView)
        
        titleLabel.topLeft(toView: view, top: 68, left: 54)
        
        stateView.center(toView: view)
        
        functionView.horizontal(toView: view)
        functionView.bottom(toView: view)
        functionView.height(120)
        
        functionView.addButton.addTarget(self, action: #selector(showCreateTaskView))
    }
    
    @objc func showBlackView() {
        let blackButton = knUIMaker.makeButton()
        blackButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blackButton.tag = 1001
        view.addSubviews(views: blackButton)
        blackButton.fill(toView: view)
        blackButton.addTarget(self, action: #selector(hideCreateTaskView))
    }

    @objc func hideCreateTaskView() {
        let blackButton = view.viewWithTag(1001)
        newTaskView.textField.resignFirstResponder()
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            self?.newTaskView.alpha = 0
            blackButton?.alpha = 0
        })

        run({ blackButton?.removeFromSuperview()
            }, after: 0.35)
    }

    @objc func showCreateTaskView() {
        showBlackView()
        newTaskView.textField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            self?.newTaskView.alpha = 1
        })
    }

}

