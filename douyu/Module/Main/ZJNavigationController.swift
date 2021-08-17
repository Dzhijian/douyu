//
//  ZJNavigationController.swift
//  douyu
//
//  Created by James on 2021/8/8.
//

import UIKit

class ZJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: 重写跳转
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count>0 {
            
            viewController.hidesBottomBarWhenPushed = true //跳转之后隐藏
        }
        
        super.pushViewController(viewController, animated: true)
    }

}
