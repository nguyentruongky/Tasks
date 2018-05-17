//
//  ViewController.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/15/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit


class tkTasksListController: knCustomTableController {
    
    var datasource = [tkTask]() { didSet {
        tableView.reloadData()
        let isEmpty = datasource.count > 0
        stateView.isHidden = isEmpty
        tableView.isHidden = !isEmpty
        }}
    
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
        fetchData()
    }
    
    override func setupView() {
        view.addSubviews(views: titleLabel, tableView, stateView, functionView)
        
        titleLabel.topLeft(toView: view, top: 68, left: 54)
        
        tableView.horizontal(toView: view)
        tableView.verticalSpacing(toView: titleLabel, space: 24)
        tableView.bottom(toAnchor: functionView.topAnchor, space: -24)
        
        stateView.center(toView: view)
        
        functionView.horizontal(toView: view)
        functionView.bottom(toView: view)
        functionView.height(120)
        
        functionView.addButton.addTarget(self, action: #selector(showCreateTaskView))
        newTaskView.saveButton.addTarget(self, action: #selector(addNewTask))
        newTaskView.textField.delegate = self
    }
    
    @objc func addNewTask() {
        datasource.insert(tkTask(name: newTaskView.textField.text!), at: 0)
        newTaskView.textField.text = ""
        hideCreateTaskView()
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
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.newTaskView.alpha = 0
            blackButton?.alpha = 0
        })
        
        run({ blackButton?.removeFromSuperview()
        }, after: 0.25)
    }
    
    @objc func showCreateTaskView() {
        showBlackView()
        newTaskView.textField.becomeFirstResponder()
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.newTaskView.alpha = 1
        })
    }
    
    override func registerCells() {
        tableView.register(tkTaskCell.self, forCellReuseIdentifier: "tkTaskCell")
    }
    
    
    override func fetchData() {
        datasource = [
            tkTask(name: "Hehe"),
            tkTask(name: "Aloha"),
        ]
    }
}

extension tkTasksListController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewTask()
        return true
    }
}

extension tkTasksListController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return datasource.count }
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tkTaskCell",
                                                 for: indexPath) as! tkTaskCell
        cell.data = datasource[indexPath.row]
        return cell
    }
    
}























