//
//  ZJSearchView.swift
//  douyu
//
//  Created by James on 2021/8/11.
//

import UIKit

class ZJSearchView: ZJBaseView {
    lazy var searchBgView : UIView = {
        let searchBgView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW - Adapt(55), height: Adapt(30)))
        searchBgView.backgroundColor = colorWithRGBA(243, 243, 243, 1.0)
        searchBgView.layer.cornerRadius = Adapt(15)
        searchBgView.layer.masksToBounds = true
        return searchBgView
    }()
    
    lazy var rightBtn : UIButton = {
        let rightBtn = UIButton()
        rightBtn.setImage(UIImage(named: "app3DTouch_checkin_35x35_"), for: .normal)
        return rightBtn
    }()
    override func zj_initWithAllView() {
        self.backgroundColor = kWhite
        addSubview(searchBgView)
        addSubview(rightBtn)
        
        searchBgView.snp.makeConstraints { (make) in
            make.left.equalTo(Adapt(15))
            make.centerY.equalToSuperview()
            make.right.equalTo(Adapt(-60))
            make.height.equalTo(Adapt(30))
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(Adapt(-15))
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
}
