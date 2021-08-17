//
//  ZJHomeViewModel.swift
//  douyu
//
//  Created by James on 2021/8/15.
//

import Foundation

protocol ZJHomeViewDelegate {
    func reloadViews(_ homeTabModel: HomeTabModel?,titleArr : [String],controllerArr : [UIViewController],selIndex: Int)
}

protocol HomeViewModelInterface {
    var delegate: ZJHomeViewDelegate? { get set }
}
class ZJHomeViewModel : NSObject, HomeViewModelInterface {
    var delegate: ZJHomeViewDelegate?
    
    var homeTabModel : HomeTabModel?
    
    override init() {
        super.init()
        self.getHomeTabModel()
    }
    
    private func getHomeTabModel() {
        ZJNetworkProvider.shared.requestDataWithTargetJSON(target: HomeAPI.mCtrl, successClosure: { (response) in
            let homeTabModel = self.getDecoderData(jsonStr:  response.description)
            self.homeTabModel = homeTabModel
            guard let topConf = homeTabModel?.topConf else {
                return
            }
            var titleArr : [String] = []
            var controllerArr : [UIViewController] = []
            var selIndex : Int = 0
            
            for (index,item) in topConf.enumerated() {
                titleArr.append(item.name)
                if item.type == "video" {
                    controllerArr.append(ZJHomeVideoController())
                }else if item.type == "live" {
                    controllerArr.append(ZJHomeLiveController())
                }else if item.type == "community" {
                    controllerArr.append(ZJHomeCommunityController())
                }else{
                    controllerArr.append(UIViewController())
                }
                if item.isSel == "1" {
                    selIndex = index
                }
            }
            self.delegate?.reloadViews(homeTabModel, titleArr: titleArr, controllerArr: controllerArr, selIndex: selIndex)
            
        }) { (error) in
            
        }
    }
    
    /*
     * 解析json数据
     * 参数jsonStr：传入json字符串
     * 返回值： 返回结构体PeopleStruct的对象
     */
    private func getDecoderData(jsonStr:String) -> HomeTabModel? {
        if let jsonData = jsonStr.data(using: .utf8) {
            do {
                let dataStruct = try JSONDecoder().decode(HomeTabModel.self, from: jsonData)
                return dataStruct
            } catch {
                debugPrint("error == \(error)")
            }
        }
        return nil
    }
    
}
