//
//  ZJHomeCategoryCell.swift
//  douyu
//
//  Created by James on 2021/8/10.
//

import UIKit

class ZJHomeCategoryCell: ZJBaseCollectionCell {
    
    lazy var imageV : UIImageView = {
        let imageV = UIImageView()
        return imageV
    }()
    
    lazy var titleLab : UILabel = {
        let titleLab = UILabel()
        titleLab.textColor = kGrayTextColor
        titleLab.font = kFont(12)
        titleLab.textAlignment = .center
        return titleLab
    }()
    
    override func zj_initWithView() {
        
        addSubview(imageV)
        addSubview(titleLab)
        
        imageV.snp.makeConstraints { (make) in
            make.left.top.equalTo(Adapt(10))
            make.right.equalTo(-Adapt(5))
            make.height.equalTo(imageV.snp.width)
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(Adapt(5))
            make.right.equalTo(-Adapt(5))
            make.bottom.equalTo(-5)
        }
    }
}
