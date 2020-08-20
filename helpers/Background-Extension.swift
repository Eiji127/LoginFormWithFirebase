//
//  Background-Extension.swift
//  LoginWithFirebase
//
//  Created by 白数叡司 on 2020/08/17.
//  Copyright © 2020 AEG. All rights reserved.
//

import UIKit

extension UIView {
    func addBackground(name: String) {

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        imageViewBackground.image = UIImage(named: name)
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
}
