//
//  ZJBannerView.swift
//  douyu
//
//  Created by James on 2021/8/11.
//

import UIKit

class ZJBannerView: ZJBaseView {
    let images = ["https://images.unsplash.com/photo-1622495805962-d93109c8def4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1593643946890-b5b85ade6451?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1529&q=80",
    "https://images.unsplash.com/photo-1628258102957-1b77367c8c6c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1628255591287-2147e76fe3f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80",
    "https://images.unsplash.com/photo-1622495891893-0eb5818ddc6e?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"]
    private lazy var banner: ZCycleView = {
        let width = self.bounds.width
        let height = self.bounds.height

        let banner = ZCycleView()
        banner.scrollDirection = .horizontal
        banner.delegate = self
        banner.itemSpacing = 0
        banner.initialIndex = 0
        banner.isAutomatic = true
        banner.reloadItemsCount(images.count)
        banner.itemSize = CGSize(width: width, height: self.bounds.height)
        banner.layer.cornerRadius = Adapt(6)
        banner.layer.masksToBounds = true
        return banner
    }()
    
    override func zj_initWithAllView() {
        addSubview(banner)
        banner.snp.makeConstraints { (make) in
            make.left.right.top.height.equalToSuperview()
        }
        
    }

}

extension ZJBannerView: ZCycleViewProtocol{
    func cycleViewRegisterCellClasses() -> [String : AnyClass] {
        return [ZJHomeBannerCell.identifier(): ZJHomeBannerCell.self]
    }
    
    func cycleViewConfigureCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, realIndex: Int) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZJHomeBannerCell.identifier(), for: indexPath) as! ZJHomeBannerCell
        cell.imageView.zj_setImage(urlStr: images[realIndex])
        return cell
    }
    
    func cycleViewDidScrollToIndex(_ cycleView: ZCycleView, index: Int) {
        
    }
    
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.isHidden = false
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .white
        pageControl.frame = CGRect(x: 0, y: cycleView.bounds.height-25, width: cycleView.bounds.width, height: 25)
    }
    
    
}
