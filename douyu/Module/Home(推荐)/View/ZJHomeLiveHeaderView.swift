//
//  ZJHomeLiveHeaderView.swift
//  douyu
//
//  Created by James on 2021/8/9.
//

import UIKit
import ZCycleView


class ZJHomeLiveHeaderView: UICollectionReusableView {
    
    lazy var bannerView : ZJBannerView = {
        let bannerView = ZJBannerView.init(frame: CGRect(x: Adapt(10), y: Adapt(5), width: kScreenW - Adapt(20), height: Adapt(130)))
        return bannerView
    }()
    lazy var categoryView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: CateItemW, height: CateItemW + Adapt(20))
        layout.minimumLineSpacing = Adapt(5)
        layout.minimumInteritemSpacing = Adapt(5)
        layout.sectionInset = UIEdgeInsets(top: 0, left: Adapt(10), bottom: 0, right: Adapt(10))
        let categoryView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 2 * (CateItemW + Adapt(20))),collectionViewLayout: layout)
        categoryView.backgroundColor = kWhite
        categoryView.delegate = self
        categoryView.dataSource = self
        categoryView.showsVerticalScrollIndicator = false
        categoryView.register(ZJHomeCategoryCell.self, forCellWithReuseIdentifier: ZJHomeCategoryCell.identifier())
        return categoryView
    }()
    
    lazy var advertsView : ZJAdvertsView = {
        let advertsView = ZJAdvertsView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: AdaptH(35)))
        return advertsView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kWhite
        addSubview(bannerView)
        addSubview(categoryView)
        addSubview(advertsView)

        bannerView.snp.makeConstraints { (make) in
            make.left.equalTo(Adapt(10))
            make.right.equalTo(Adapt(-10))
            make.top.equalTo(Adapt(5))
            make.height.equalTo(Adapt(130))
        }
        
        categoryView.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView.snp.bottom).offset(Adapt(5))
            make.left.right.equalTo(0)
            make.height.equalTo((CateItemW + Adapt(20)) * 2 + Adapt(10))
        }
        
        advertsView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryView.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo((Adapt(35)))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZJHomeLiveHeaderView : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZJHomeCategoryCell.identifier(), for: indexPath) as! ZJHomeCategoryCell
        cell.imageV.image = UIImage(named: "series_danmu_banned_27x27_")
        cell.titleLab.text = "全部直播"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

