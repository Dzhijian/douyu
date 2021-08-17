//
//  ZJAdvertsCell.swift
//  douyu
//
//  Created by James on 2021/8/10.
//

import UIKit

class ZJAdvertsCell: ZJBaseCollectionCell {
    lazy var titleLab : UILabel = {
        let titleLab = UILabel()
        titleLab.textColor = kGrayTextColor
        titleLab.font = kFont(14)
        return titleLab
    }()
    override func zj_initWithView() {
        self.contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(15)
        }
    }
}
