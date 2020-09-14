//
//  TaskTableViewCell.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

  var taskCellLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          addSubview(taskCellLabel)
          
          configureTitleLabel()
          setTitleLabelConstraints()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      func set(data: String){
          taskCellLabel.text = data
      }
      
      func configureTitleLabel(){
          taskCellLabel.numberOfLines = 0 // word wrap
          taskCellLabel.adjustsFontSizeToFitWidth = true // will shirnk title if needed
      }
      
      func setTitleLabelConstraints(){
          taskCellLabel.translatesAutoresizingMaskIntoConstraints = false
          taskCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
          taskCellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
          taskCellLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
          taskCellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
      }

}
