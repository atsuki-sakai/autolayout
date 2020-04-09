//
//  CircleImageView.swift
//  autolayout
//
//  Created by 酒井専冴 on 2020/04/01.
//  Copyright © 2020 sakai_atsuki. All rights reserved.
//

import Foundation
import UIKit

class CircleImageView:UIImageView{
    
    override var image: UIImage?{
        
        didSet{
            
            layer.masksToBounds = false
            clipsToBounds = true
            layer.cornerRadius = frame.height/2
            
    
        }
    }
}
