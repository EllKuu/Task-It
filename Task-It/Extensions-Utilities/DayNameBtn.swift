//
//  DayNameBtn.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit

class DayNameBtn: UIButton {
    
    var buttonName: String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        buttonName = ""
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttonName = ""
        setupButton()
    }
    
    
    func setupButton(){
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "arial", size: 28)
    }
    
}
