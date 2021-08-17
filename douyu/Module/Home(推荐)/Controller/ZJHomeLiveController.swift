//
//  ZJHomeLiveController.swift
//  douyu
//
//  Created by James on 2021/8/8.
//

import UIKit
private let kItemMargin : CGFloat = Adapt(10)
private let kItemW = (kScreenW - kItemMargin * 4) / 2
private let kItemH = kItemW * 6 / 7
private let kHeaderViewH : CGFloat =  Adapt(50)
let CateItemW = (kScreenW - Adapt(50)) / 5

class ZJHomeLiveController: ZJBaseViewController,UIScrollViewDelegate  {

    var liveViewModel : ZJHomeLiveViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func initWithView() {
        self.view.addSubview(searchView)
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(searchView.snp.bottom)
        }
    }
    
    override func initWithData() {
        self.liveViewModel = ZJHomeLiveViewModel()
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > Adapt(40) {
            UIView.animate(withDuration: 0.25) { [self] in
                searchView.frame = CGRect(x: 0, y: -Adapt(40), width: kScreenW, height: AdaptW(40))
                collectionView.snp.remakeConstraints { (make) in
                    make.left.right.top.bottom.equalToSuperview()
                }
            } completion: { (success) in

            }

        }else{
            UIView.animate(withDuration: 0.25) { [self] in
                searchView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: AdaptW(40))
                collectionView.snp.remakeConstraints { (make) in
                    make.left.right.bottom.equalToSuperview()
                    make.top.equalTo(searchView.snp.bottom)
                }
            } completion: { (success) in

            }
        }
    }
    
    lazy var collectionView :UICollectionView = {
        let collectionView = self.getCollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kNavHeight-kTabBarHeight),
                                                    itemSize: CGSize(width: kItemW, height: kItemH),
                                                    lineSpacing: kItemMargin,
                                                    interitemSpacing: kItemMargin,
                                                    sectionInset: UIEdgeInsets(top: kItemMargin, left: Adapt(15), bottom: Adapt(20), right: Adapt(15)),
                                                    backgroundColor: kBGGrayColor,
                                                    delegate:self,
                                                    dataSource: self) { (layout) in
            layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: Adapt(190) + 2 * (CateItemW + Adapt(20)));

        }
        collectionView.register(ZJHomeLiveCell.self, forCellWithReuseIdentifier: ZJHomeLiveCell.identifier())
        collectionView.register(ZJHomeLiveHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ZJHomeLiveHeaderView")
        return collectionView
        
    }()
    
    lazy var searchView : ZJSearchView = {
        let searchView = ZJSearchView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: Adapt(40)))
        return searchView
    }()
}

extension ZJHomeLiveController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZJHomeLiveCell.identifier(), for: indexPath) as! ZJHomeLiveCell
        cell.imageV.zj_setImage(urlStr: "https://images.unsplash.com/photo-1593642702909-dec73df255d7?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80")
        cell.titleLab.text = "旭阳宝宝爆笑斗地主哈哈哈-7月"
        cell.detailLab.text = "官方推荐"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView :UICollectionReusableView?

        if kind == UICollectionView.elementKindSectionHeader {
            let header : ZJHomeLiveHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ZJHomeLiveHeaderView", for: indexPath) as! ZJHomeLiveHeaderView
                       
            reusableView = header
        }
        return reusableView ?? UICollectionReusableView()
    }
    
}

