//
//  StateView.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/16/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class tkStateView: knView {
    let imageView = knUIMaker.makeImageView(image: UIImage(named: "first_empty"), contentMode: .scaleAspectFill)
    let emptyBoldLabel = knUIMaker.makeLabel(text: "A fresh start",
                                             font: UIFont.boldSystemFont(ofSize: 16),
                                             color: .black, alignment: .center)
    let emptyActionLabel = knUIMaker.makeLabel(text: "Anything to add?",
                                               font: UIFont.systemFont(ofSize: 16),
                                               color: UIColor.color(r: 96, g: 99, b: 104),
                                               alignment: .center)
    override func setupView() {
        addSubviews(views: imageView, emptyBoldLabel, emptyActionLabel)
        addConstraints(withFormat: "V:|[v0]-44-[v1]-8-[v2]|", views: imageView, emptyBoldLabel, emptyActionLabel)
        
        imageView.square(edge: screenWidth / 2)
        imageView.horizontal(toView: self)
        
        emptyBoldLabel.horizontal(toView: self)
        
        emptyActionLabel.horizontal(toView: self)
    }
}
