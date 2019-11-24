//
//  Extensions.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/24/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//


/**
* This extension file it tends to contain all extension classes.
    Extensions in Swift can:
     Add computed instance properties and computed type properties
     Define instance methods and type methods
     Provide new initializers
     Define subscripts
     Define and use new nested types
     Make an existing type conform to a protocol
*/
import Foundation
import UIKit


/*
* #UIViewController extension to extend extra features for UIViewController classes
*/

extension UIViewController{
    
    //showing text on the screen
    //it can be used to show the text in any uiviewcontroller classes
    //method has one param - message (String type) is text
    //of the message that is to be shown in the sceen
       func showToast(message : String) {
           let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150,
                                                  y: self.view.frame.size.height-210, width: 310, height: 35))
           toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
           toastLabel.textColor = UIColor.white
           toastLabel.textAlignment = .center;
           toastLabel.font = UIFont(name: Utils.FONT_NAME, size: 12.0)
           toastLabel.text = message
           toastLabel.alpha = 1.0
           toastLabel.layer.cornerRadius = 10;
           toastLabel.clipsToBounds  =  true
           self.view.addSubview(toastLabel)
           UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
               toastLabel.alpha = 0.0
           }, completion: {(isCompleted) in
               toastLabel.removeFromSuperview()
           })
       }
    
}
