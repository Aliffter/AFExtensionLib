//
//  Bundle.swift
//  AFExtensionLib_Example
//
//  Created by 赵隆晓 on 2024/3/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
/*
 如果是依赖库，则在本库中可以使用，
 如果是在podfile中导入，在此处不能使用
 例如：
 import SwifterSwift 会报错

 */

import Localize_Swift
//import SwifterSwift

extension Bundle{
 
    public static func current() -> Bundle? {
        
        guard let path = Bundle(for: AFExtensionLib.self).resourcePath?.appending("/AFExtensionLib.xcassets") else {
            print("currentBundle - nil")

            return nil
        }
        let bundle = Bundle(path: path)
        print("currentBundle - \(bundle)")
        return bundle
    }
}

extension UIImage{
    public static func image(_ named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle.current(), compatibleWith: nil)
    }
}


extension String{
   public func localString() -> String {
       return self.localized(in: Bundle.current())
    }
}
