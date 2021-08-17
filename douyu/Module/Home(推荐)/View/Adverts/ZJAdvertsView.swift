//
//  ZJAdvertsView.swift
//  douyu
//
//  Created by James on 2021/8/10.
//

import UIKit

/// 轮播广告
class ZJAdvertsView: ZJBaseView {
    
    let data  = [1,2,3,4,5];
    
    private lazy var adverts: ZCycleView = {
        let width = self.bounds.width
        let adverts = ZCycleView()
        adverts.scrollDirection = .vertical
        adverts.delegate = self
        adverts.itemSpacing = 0
        adverts.initialIndex = 0
        adverts.isAutomatic = true
        adverts.itemSize = CGSize(width: width, height: Adapt(35))
        adverts.backgroundColor = kWhite
        
        return adverts
    }()
    
    lazy var lineView : UIView = {
        let lineView = UIView()
        lineView.backgroundColor = klineColor
        return lineView
    }()
    
    override func zj_initWithAllView() {
        addSubview(adverts)
        addSubview(lineView)        
        adverts.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(0.5)
        }
        adverts.reloadItemsCount(data.count)
    }

}


extension ZJAdvertsView: ZCycleViewProtocol{
    func cycleViewRegisterCellClasses() -> [String : AnyClass] {
        return [ZJAdvertsCell.identifier(): ZJAdvertsCell.self]
    }
    
    func cycleViewConfigureCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, realIndex: Int) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZJAdvertsCell.identifier(), for: indexPath) as! ZJAdvertsCell
        cell.titleLab.text = "\(data[realIndex]) 广告条------------->"
        return cell
    }
    
    func cycleViewDidScrollToIndex(_ cycleView: ZCycleView, index: Int) {
        
    }
    
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.isHidden = true
        pageControl.frame = CGRect(x: 0, y: 0, width: 0,height: 0)

    }
    
    
}
