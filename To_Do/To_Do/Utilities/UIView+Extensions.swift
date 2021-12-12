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
    
    func checkBox(_ imageName:String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(systemName: imageName)
        image.tintColor = .black
        return image
    }
    
    
    
}


