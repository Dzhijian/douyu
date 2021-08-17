//
//  ZJHomeLiveCell.swift
//  douyu
//
//  Created by James on 2021/8/9.
//

//import UIKit

class ZJHomeLiveCell: ZJBaseCollectionCell {
    
    lazy var imageV : UIImageView = {
        let imageV = UIImageView()
        
        return imageV
    }()
    
    lazy var titleLab : UILabel = {
        let titleLab = UILabel()
        titleLab.textColor = kBlack
        titleLab.font = kFont(12)
        return titleLab
    }()
    
    lazy var detailLab : UILabel = {
        let detailLab = UILabel()
        detailLab.textColor = kBlack
        detailLab.font = kFont(12)
        return detailLab
    }()
    
    lazy var bgView : UIView = {
        let bgView = UIView()
        bgView.backgroundColor = kWhite
        bgView.layer.cornerRadius = Adapt(6)
        bgView.layer.masksToBounds = true
        return bgView
    }()
    
    override func zj_initWithView() {
        self.contentView.backgroundColor = kClear
        self.contentView.addSubview(bgView)
        bgView.addSubview(imageV)
        bgView.addSubview(titleLab)
        bgView.addSubview(detailLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        
        imageV.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(Adapt(-50))
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(Adapt(7))
            make.left.equalTo(Adapt(5))
            make.right.equalTo(Adapt(-5))
        }
        
        detailLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(Adapt(-7))
            make.left.equalTo(Adapt(5))
            make.right.equalTo(Adapt(-5))
        }
        
    }
    
    
}
