//
//  TextFieldLeftPadding.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class TextFieldLeftPadding: UITextField{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}


