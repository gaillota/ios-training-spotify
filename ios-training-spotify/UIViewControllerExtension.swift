//
//  UIViewControllerExtension.swift
//  PokemonTest
//
//  Created by Antoine Gaillot on 05/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(message: String, title: String = "An error occured") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}