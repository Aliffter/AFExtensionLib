//
//  AFExtensionLib.swift
//  AFExtensionLib_Example
//
//  Created by 赵隆晓 on 2024/3/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//
import Localize_Swift

public class AFExtensionLib {
    public static let share = AFExtensionLib()
    
    public func test()  {
        print("xxxx ---test--- xxxx")
        print("xxxx ---\( "Title".localString())--- xxxx")

       
    }
}
