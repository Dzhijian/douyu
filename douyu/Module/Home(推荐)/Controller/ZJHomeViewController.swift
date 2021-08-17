//
//  ZJHomeViewController.swift
//  douyu
//
//  Created by James on 2021/8/8.
//

import UIKit

class ZJHomeViewController: ZJBaseViewController, ZJHomeViewDelegate {
    
    lazy var topTabs = [HomeTopConf]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func initWithView() {
        self.navigationItem.titleView = self.pageTitleView
        self.view.addSubview(self.pageContenView)
        self.pageContenView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
    }
    
    override func initWithData() {
        let homeViewmodel = ZJHomeViewModel()
        homeViewmodel.delegate = self
    }
    
    func reloadViews(_ homeTabModel: HomeTabModel?, titleArr: [String], controllerArr: [UIViewController], selIndex: Int) {
        guard let topConf = homeTabModel?.topConf else {
            return
        }
        self.topTabs = topConf
        titles = titleArr
        controllers = controllerArr
        pageTitleView.currentIndex = selIndex
        pageTitleView.titles = titles
        pageContenView.childVCs = controllers
        pageTitleView.reloadView()
        
    }
    
    @objc func leftAction(){
        
    }
    
    // 标题数组
    private lazy var titles : [String] = []
    // 控制器数组
    private lazy var controllers : [UIViewController] = []
    // 标题View
    private lazy var pageTitleView : ZJPageTitleView = { [weak self] in
        let frame = CGRect(x: 0, y: 0, width: kScreenW - Adapt(110), height: kCateTitleH)
        let option = ZJPageOptions()
        option.isTitleScrollEnable = false
        option.itemAliginment = ItemAliginment.center
        option.kItemWidth = Adapt(55)
        option.kScrollLineWidth = Adapt(15)
        option.kBotLineColor = kOrange
        option.kNormalColor = (33,33,33)
        option.kSelectColor = (255,86,40)
        option.kTitleSelectFontSize = 16
        option.kTitleFontSize = 15
        option.kIsNormalFontBold = true
        option.kBotLineHeight = 3
        option.showBottomLine = true
        option.kscrollViewBGColor = kClear
        option.showBottomBorderLine = false
        
        let pageTitleViw = ZJPageTitleView(frame: frame, titles: titles ,options:option)
        pageTitleViw.delegate = self
        return pageTitleViw
    }()
    
    private lazy var pageContenView : ZJPageContentView = { [weak self] in
        let contentView = ZJPageContentView(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - kNavHeight - kTabBarHeight), childVCs: controllers, parentViewController:self!)
        contentView.delegate = self
        
        return contentView
    }()
}

extension ZJHomeViewController : PageTitleViewDelegate,ZJPageContentViewDelegate {
    func pageTitleView(titleView: ZJPageTitleView, selectedIndex index: Int) {
        pageContenView.setCurrentIndex(currentIndex: index)
    }
    
    func zj_pageContentView(contentView: ZJPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setPageTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
