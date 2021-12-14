//
//  onBoardingViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class onBoardingViewController: UIViewController {
    let todo = TodoConfig()
    var coordinator:Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
      

        setUpViews()
        addConstraints()
    }
    
    lazy var addTaskImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "add")
        iv.image = image
        iv.isHidden = false
        return iv
    }()
    lazy var arrow: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(systemName: "arrow.right")
        iv.image = image
        iv.isHidden = false
        return iv
    }()
    
    
    func setUpViews(){
        view.addSubviews(addTaskImage)
        view.addSubviews(arrow)
    }
    func addConstraints(){
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
     
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.centerYAnchor.constraint(equalTo: addTaskImage.centerYAnchor).isActive = true
        arrow.trailingAnchor.constraint(equalTo: addTaskImage.leadingAnchor).isActive = true
        arrow.widthAnchor.constraint(equalToConstant: width * 0.15).isActive = true
//         arrow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        addTaskImage.translatesAutoresizingMaskIntoConstraints = false
        addTaskImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addTaskImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        addTaskImage.widthAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        addTaskImage.heightAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        
        addTaskImage.backgroundColor = .blue
    }
}
