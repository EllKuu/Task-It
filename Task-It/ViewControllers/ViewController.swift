//
//  ViewController.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView = UIStackView()
    let daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Task-It"
        configureStackView()
    }
    
    func configureStackView(){
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        // set constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        
        // addbuttons to stackView
        addButtonsToStackView()
    }
    
    func addButtonsToStackView(){
        for i in 0 ..< daysOfTheWeek.count{
            let button = DayNameBtn()
            button.setTitle(daysOfTheWeek[i], for: .normal)
            button.buttonName = daysOfTheWeek[i]
            button.addTarget(self, action: #selector(buttonTapped(sender: )), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
    }
    
    @objc func buttonTapped(sender: DayNameBtn){
          let nextScreen = DetailViewController()
          nextScreen.title = sender.buttonName
          nextScreen.dayOfWeek = sender.buttonName!
          navigationController?.pushViewController(nextScreen, animated: true )
          
      }
    

}
