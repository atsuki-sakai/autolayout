//
//  XRPPriceModel.swift
//  autolayout
//
//  Created by 酒井専冴 on 2020/04/01.
//  Copyright © 2020 sakai_atsuki. All rights reserved.
//

import Foundation

class XRPModel{
    
    var nowLowPrice:String!
    var nowHighPrice:String!
    var dayLowPrice:String!
    var dayHighPrice:String!
    
    init(NLP:String,NHP:String,DLP:String,DHP:String) {
        
        self.nowLowPrice = NLP
        self.nowHighPrice = NHP
        self.dayLowPrice = DLP
        self.dayHighPrice = DHP
        
    }
    
    
}
