//
//  UIView+Ext.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit

extension UIView{
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive   = true
    }
    
}
