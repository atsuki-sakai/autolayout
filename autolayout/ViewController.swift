//
//  ViewController.swift
//  autolayout
//
//  Created by 酒井専冴 on 2020/03/30.
//  Copyright © 2020 sakai_atsuki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: CircleImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nowLowPriceLabel: UILabel!
    @IBOutlet weak var nowHighPriceLabel: UILabel!
    @IBOutlet weak var dayLowPriceLabel: UILabel!
    @IBOutlet weak var dayHighPriceLabel: UILabel!
    @IBOutlet weak var segementedCoin: UISegmentedControl!
    
    let XRPURLString:String = "https://public.bitbank.cc/xrp_jpy/ticker"
    let BitCoinURLString:String = "https://public.bitbank.cc/btc_jpy/ticker"
    let MonaURLString:String = "https://public.bitbank.cc/mona_jpy/ticker"
    
    var nowLowPrice:String?
    var nowHighPrice:String?
    var dayLowPrice:String?
    var dayHighPrice:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.segementedCoin.addTarget(self, action: #selector(ViewController.changeSegemented), for: .valueChanged)
        
        fromURLToPriceLabel(URL: URL(string: XRPURLString)!)
        titleLabel.text = "XRP"
        imageView.image = UIImage(named: "ripple")
        descriptionLabel.text = "直近のXRPの動向"
        
        
    }
    @objc func changeSegemented(segemented:UISegmentedControl){
        
        switch segemented.selectedSegmentIndex {
        case 0:
            fromURLToPriceLabel(URL: URL(string: XRPURLString)!)
            titleLabel.text = "XRP"
            imageView.image = UIImage(named: "ripple")
            descriptionLabel.text = "直近のXRPの動向"
            return
        case 1:
            
            fromURLToPriceLabel(URL: URL(string: BitCoinURLString)!)
            
            titleLabel.text = "BitCoin"
            imageView.image = UIImage(named: "bitCoin")
            descriptionLabel.text = "直近のBitCoinの動向"
            
            return
        case 2:
            fromURLToPriceLabel(URL: URL(string: MonaURLString)!)
            
            titleLabel.text = "Mona"
            imageView.image = UIImage(named: "mona")
            descriptionLabel.text = "直近のMonaの動向"
            
            return
        default:
            fromURLToPriceLabel(URL: URL(string: XRPURLString)!)
            
            titleLabel.text = "XRP"
            imageView.image = UIImage(named: "ripple")
            descriptionLabel.text = "直近のXRPの動向"
            
            return
        }
    }
    fileprivate func fromURLToPriceLabel(URL: URL){
        
        var json:JSON?
        AF.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                json = JSON(response.data as Any)
                
                self.nowLowPrice = json!["data"]["sell"].string
                self.nowHighPrice = json!["data"]["buy"].string
                self.dayLowPrice = json!["data"]["low"].string
                self.dayHighPrice = json!["data"]["high"].string
                
                self.nowLowPriceLabel.text = "\(self.nowLowPrice!)円"
                self.nowHighPriceLabel.text = "\(self.nowHighPrice!)円"
                self.dayLowPriceLabel.text = "\(self.dayLowPrice!)円"
                self.dayHighPriceLabel.text = "\(self.dayHighPrice!)円"
            case .failure(let error):
                
                print(error.localizedDescription)
                return
            
            }
        }
    }
}



