//
//  ViewController.swift
//  AFExtensionLib
//
//  Created by Aliffter on 03/20/2024.
//  Copyright (c) 2024 Aliffter. All rights reserved.
//

import UIKit
import AFExtensionLib
import SnapKit
import Hue
//import SwifterSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.randomColor
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#FF8877")
        view.addSubview(v)
        v.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        AFExtensionLib.share.test()
        
//        let imgv = UIImageView(image: UIImage(named: "car_icon"))
        let imgv = UIImageView()
        imgv.image = UIImage.image("car_icon")
        view.addSubview(imgv)
        imgv.snp.makeConstraints { make in
            make.top.equalTo(v.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        let lab = UILabel()
        lab.text = "Subtitle".localString()
        view.addSubview(lab)
        lab.snp.makeConstraints { make in
            make.top.equalTo(imgv.snp.bottom).offset(20)
            make.centerX.equalToSuperview()

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

