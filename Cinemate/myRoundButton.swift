//
//  myRoundButton.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 18/4/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit

@IBDesignable
class myRoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
         didSet{
         self.layer.cornerRadius = cornerRadius
             
         }
     }

     @IBInspectable var borderWidth: CGFloat = 0{
         didSet{
             self.layer.borderWidth = borderWidth
         }
     }

     @IBInspectable var borderColor: UIColor = UIColor.clear{
         didSet{
             self.layer.borderColor = borderColor.cgColor
         }
     }

}
