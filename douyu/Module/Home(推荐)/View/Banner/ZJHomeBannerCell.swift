//
//  ZJHomeBannerCell.swift
//  douyu
//
//  Created by James on 2021/8/9.
//

import UIKit

class ZJHomeBannerCell: ZJBaseCarouselCell {
    lazy var imageView = UIImageView()
    override func zj_initWithView() {
        imageView.frame = contentView.bounds
        contentView.addSubview(imageView)
    }
}
