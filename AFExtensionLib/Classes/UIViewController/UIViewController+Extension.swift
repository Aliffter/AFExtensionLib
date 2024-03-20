//
//  UIViewControllerExtension.swift
//  ZLSalesServices
//
//  Created by 赵隆晓 on 2021/5/11.
//

import UIKit

extension UIViewController {
    /// MARK: 提示窗
    func showAlert(title: String?, message:String?, actionStr:String = "确定")  {
        let cTitle = title ?? "   "
        let cMessage = "\(message ?? "")\n"
        let alertVC = UIAlertController(title: cTitle, message: cMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionStr, style: .default, handler: { (action) in
        })
        action.setValue(UIColor.themeColor, forKey: "titleTextColor")
    


        alertVC.addAction(action)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    /// MARK: 提示窗 带确认回调
    func showAlert(title: String?, message:String?,actionStr:String = "确定", commit: @escaping ((UIAlertAction) -> Void))   {
        let cTitle = title ?? "   "
        let cMessage = "\(message ?? "")\n"
        let alertVC = UIAlertController(title: cTitle, message: cMessage, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: actionStr, style: .default, handler: { (action) in
            commit(action)
        }))
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    /// MARK: 提示窗 带取消/确认回调
    func showAlert(title: String?, message:String?, commit: @escaping ((UIAlertAction) -> Void) , cancle:@escaping ((UIAlertAction) -> Void))   {
        
        let cTitle = title ?? "   "
        let cMessage = "\(message ?? "")"

        let alertVC = UIAlertController(title: cTitle, message: cMessage, preferredStyle: .alert)
        
        let cancleAction = UIAlertAction(title: "取消", style: .default, handler: { (action) in
            cancle(action)
        })
        cancleAction.setValue(UIColor.hex(hexString: "#666666"), forKey: "titleTextColor")
        
        let commitAction = UIAlertAction(title: "确定", style: .default, handler: { (action) in
            commit(action)
        })
        commitAction.setValue(UIColor.themeColor, forKey: "titleTextColor")

        alertVC.addAction(cancleAction)
        alertVC.addAction(commitAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    /// MARK: 提示窗 带取消/确认回调
    func showCallAlert(title: String?, message:String?, commit: @escaping ((UIAlertAction) -> Void) , cancle:@escaping ((UIAlertAction) -> Void))   {
        
        let cTitle = title ?? "   "
        let cMessage = "\(message ?? "")"
        let alertVC = UIAlertController(title: cTitle, message: cMessage, preferredStyle: .alert)
        let  messageFont =  UIFont.systemFont(ofSize: 16)
        let  messageAttribute =  NSMutableAttributedString.init (string:  alertVC.message!)
        messageAttribute.addAttributes([ NSAttributedString.Key.font :messageFont,
                                         NSAttributedString.Key.foregroundColor : UIColor.darkGray],
                                     range: NSMakeRange (0, ( alertVC.message?.count)!))
         alertVC.setValue(messageAttribute, forKey:  "attributedMessage" )
        let cancleAction = UIAlertAction(title: "取消", style: .default, handler: { (action) in
            cancle(action)
        })
//        cancleAction.setValue(UIColor.hex(hexString: "#C6C6C6"), forKey: "titleTextColor")
        
        let commitAction = UIAlertAction(title: "确定", style: .default, handler: { (action) in
            commit(action)
        })
        alertVC.addAction(cancleAction)
        alertVC.addAction(commitAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    /// 当前显示的控制器
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
    

    // 全屏模态跳转
    public func present(_ controller: UIViewController,
                      style: UIModalPresentationStyle = .fullScreen ,
                      animated flag: Bool = true,
                      completion: (() -> Void)? = nil){
        
        controller.modalPresentationStyle = style
        self.present(controller, animated: flag, completion: completion)
    }

    
    
}
