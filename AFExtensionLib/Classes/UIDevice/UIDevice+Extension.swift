//
//  UIDevice+Extension.swift
//  SwiftNoteStudy
//
//  Created by less on 2018/11/13.
//  Copyright © 2018 lj. All rights reserved.
//

import UIKit

extension UIDevice {

    class func getDeviceId()->String{
        let identifierStr : String = UIDevice.current.identifierForVendor?.uuidString ?? "noUuid"
        return identifierStr
    }

    
    class func keywindows() -> UIWindow? {
     
        var window:UIWindow? = nil
     
        if #available(iOS 13.0, *) {
            for windowScene:UIWindowScene in ((UIApplication.shared.connectedScenes as? Set<UIWindowScene>)!){
                if windowScene.activationState == .foregroundActive{
                    window = windowScene.windows.first
                    break
                }
            }
           return window
        }else{
            return UIApplication.shared.keyWindow
        }
    }
    
    /// 获取具体的设备型号
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting:systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
            case "iPod5,1":
                return "iPod Touch 5"
            case "iPod7,1":
                return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":
                return "iPhone 4"
            case "iPhone4,1":
                return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":
                return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":
                return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":
                return "iPhone 5s"
            case "iPhone7,2":
                return "iPhone 6"
            case "iPhone7,1":
                return "iPhone 6 Plus"
            case "iPhone8,1":
                return "iPhone 6s"
            case "iPhone8,2":
                return "iPhone 6s Plus"
            case "iPhone9,1":
                return "iPhone 7 (CDMA)"
            case "iPhone9,3":
                return "iPhone 7 (GSM)"
            case "iPhone9,2":
                return "iPhone 7 Plus (CDMA)"
            case "iPhone9,4":
                return "iPhone 7 Plus (GSM)"
            case "iPhone10,1", "iPhone10,4":
                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":
                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":
                return "iPhone X"
            case "iPhone11,2":
                return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":
                return "iPhone XS Max"
            case "iPhone11,8":
                return "iPhone XR"
            case "iPhone12,1":
                return "iPhone 11"
            case "iPhone12,3":
                return "iPhone 11 Pro"
            case "iPhone12,5":
                return "iPhone 11 Pro Max"
            default:
                return identifier

       }
    }
}


extension UIDevice {
    
    /// 顶部安全区高度
    static func zl_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }
    
    /// 底部安全区高度
    static func zl_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }
    
    /// 顶部状态栏高度（包括安全区）
    static func zl_statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    /// 导航栏高度
    static func zl_navigationBarHeight() -> CGFloat {
        return 44.0
    }
    
    /// 状态栏+导航栏的高度
    static func zl_navigationFullHeight() -> CGFloat {
        return UIDevice.zl_statusBarHeight() + UIDevice.zl_navigationBarHeight()
    }
    
    /// 底部导航栏高度
    static func zl_tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部导航栏高度（包括安全区）
    static func zl_tabBarFullHeight() -> CGFloat {
        return UIDevice.zl_tabBarHeight() + UIDevice.zl_safeDistanceBottom()
    }
}
