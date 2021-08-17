//
//  ZJBaseViewController.swift
//  douyu
//
//  Created by James on 2021/8/8.
//

import UIKit

class ZJBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kBGGrayColor
        automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.barTintColor = kWhite
        navigationController?.navigationBar.isTranslucent = false
        initWithView();
        initWithData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 导航栏置透明
        //        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // 隐藏导航栏分割线
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /// 初始化页面
    func initWithView() {
        
    }
    
    /// 初始化数据
    func initWithData(){
        
    }
    
    /// collectionView 配置
    func getCollectionView(frame:CGRect,itemSize:CGSize,lineSpacing:CGFloat,interitemSpacing:CGFloat,sectionInset: UIEdgeInsets,backgroundColor:UIColor,delegate:UICollectionViewDelegate,dataSource:UICollectionViewDataSource,layoutBlock:(_ layout:UICollectionViewFlowLayout)->()) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitemSpacing
        layoutBlock(layout)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        layout.sectionInset = sectionInset
        collectionView.backgroundColor = kBGGrayColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource

        return collectionView
    }
    
    deinit {
        
    }
    
}
