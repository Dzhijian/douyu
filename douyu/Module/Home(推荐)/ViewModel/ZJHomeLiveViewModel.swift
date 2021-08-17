//
//  zjHomeLiveViewModel.swift
//  douyu
//
//  Created by James on 2021/8/16.
//

import Foundation

class ZJHomeLiveViewModel : NSObject{
    
    override init() {
        super.init()
        getBannerData()
    }
    
    private func getBannerData() {
        ZJNetworkProvider.shared.requestDataWithTargetJSON(target: HomeAPI.getinfo, successClosure: { (response) in
            print("HomeAPI.getinfo")
            print(response)
        }){ (error) in
            
        }
        

        ZJNetworkProvider.shared.requestDataWithTargetJSON(target: HomeAPI.getSlidesRec, successClosure: { (response) in
            print("HomeAPI.getSlidesRec")
            print(response)
        }){ (error) in
            
        }
    }
}
