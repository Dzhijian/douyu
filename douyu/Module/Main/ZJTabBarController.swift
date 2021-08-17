//
//  ZJTabBarController.swift
//  douyu
//
//  Created by James on 2021/8/8.
//

import UIKit

class ZJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAllViewController()
        // 设置图片和文字选中时的颜色   必须设置（系统默认选中蓝色）
        self.tabBar.tintColor = UIColor.orange
        
    }
    
    // 添加所有控件
    func setUpAllViewController() {
        setUpChildController(ZJHomeViewController(), "推荐","tabLive_44x44_","tabLiveHL_44x44_")
        setUpChildController(ZJRecreationViewController(), "娱乐",  "tabYule_44x44_",  "tabYuleHL_44x44_")
        setUpChildController(ZJFollowViewController(), "关注",  "tabFocus_44x44_",  "tabFocusHL_44x44_")
        setUpChildController(ZJFishClubViewController(), "鱼吧",  "tabYuba_44x44_",  "tabYubaHL_44x44_")
        setUpChildController(ZJMineViewController(), "我的",  "tabMine_44x44_",  "tabMineHL_44x44_")
        
    }
    
    // 设置子控件属性
    private func setUpChildController(_ controller : UIViewController,_ title : String,_ norImage : String,_ selectedImage : String){
        
        controller.tabBarItem.title = title
        // 修改TabBar标题位置
        controller.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -3)
        controller.tabBarItem.image = UIImage(named: norImage)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        // 设置 NavigationController
        let nav = ZJNavigationController(rootViewController: controller)
        controller.title = title
        self.addChild(nav)
        
    }


}
