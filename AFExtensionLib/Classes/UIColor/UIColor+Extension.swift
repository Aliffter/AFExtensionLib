//
//  UIColor+Extension.swift
//  SwiftNoteStudy
//
//  Created by less on 2018/11/13.
//  Copyright © 2018 lj. All rights reserved.
//

import UIKit

extension UIColor {
    //返回随机颜色
    public class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    // view 背景色
    class var backColor: UIColor {
        return .hex(hexString: "#F8F8F8")
    }
    
    //占位符字体颜色
    class var holderTextColor: UIColor {
        return .hex(hexString: "#A4A4A4")
    }
    
    /** 主色 红色 */
    public class var themeColor: UIColor {
        return .hex(hexString: "#F9494C")
    }
    
    /** 按钮不可点击颜色 */
    public class var unEnableColor: UIColor {
        return .hex(hexString: "#EFA8A7", alpha: 1)
    }
    
    /// 渐变色 - startColor
    public class var startColor: UIColor {
        return .hex(hexString: "#F9494C")
    }
    /// 渐变色 - endColor
    public class var endColor: UIColor {
        return .hex(hexString: "#F9494C")
    }
    
    
    /** 线的颜色 */
    public class var lineColor: UIColor {
        return .hex(hexString: "#EDEDED", alpha: 1)
    }
    
    
    
    /** 线的颜色F2 */
    public class var lineColor_F2: UIColor {
        return .hex(hexString: "#F2F2F2")
    }
    
    public class var textColor_333333: UIColor {
        return .hex(hexString: "#333333")
    }
    
    public class var textColor_666666: UIColor {
        return .hex(hexString: "#666666")
    }
    
    public class var textColor_888888: UIColor {
        return .hex(hexString: "#888888")
    }
    
    public class var textColor_999999: UIColor {
        return .hex(hexString: "#999999")
    }
    
    public class var textColor_cccccc: UIColor {
        return .hex(hexString: "#CCCCCC")
    }

    /** 字体颜色 */
    public class var textColor_FF584B: UIColor {
        return .hex(hexString: "#FF584B")
    }
    
    public class var textColor_0087FF: UIColor {
        return .hex(hexString: "#0087FF")
    }
    
    // 红色
    public class var textColor_D9172A: UIColor {
        return .hex(hexString: "#D9172A")
    }
    
    public class var textColor_FFA001: UIColor {
        return .hex(hexString: "#6d62ff")
    }
    
    public class var textColor_FF0000: UIColor {
        return .hex(hexString: "#FF0000")
    }
    
    public class var color_orange:UIColor{
        return .hex(hexString: "#F0A828")
    }
   
    
    public class var textColor_f20c0c: UIColor {
        return .hex(hexString: "#f20c0c")
    }
    
    public class var shadowColor: UIColor {
        return .hex(hexString: "#eaeaea")
    }
    
    class func hex(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        // 去除空格
        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        // 去除#
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        Scanner(string: cString[0..<2]).scanHexInt32(&red)
        Scanner(string: cString[2..<4]).scanHexInt32(&green)
        Scanner(string: cString[4..<6]).scanHexInt32(&blue)
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    
    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    
    /// 适配暗黑模式
    class func generateDynamicColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            let dyColor = UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return lightColor
                }else {
                    return darkColor
                }
            }
            return dyColor
        }else {
            return lightColor
        }
    }
}

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}

