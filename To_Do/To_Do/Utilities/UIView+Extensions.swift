//
//  UIView+Extensions.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit


public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func checkBox(_ imageName:String, _ view:UIView) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(systemName: imageName)
        image.tintColor = .black
//        image.frame = CGRect(x: 20, y: 5, width: UIImage(systemName: imageName)!.size.width - 5, height: view.frame.size.height  - 25)
        return image
    }
    
    
    
}


