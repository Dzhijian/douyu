//
//  ZJNetwork.swift
//  douyu
//
//  Created by James on 2021/8/12.
//

import Foundation
import AdSupport

enum HomeAPI {
    case mCtrl
    case getinfo            // banner
    case getSlidesRec       // banner
//    case recommendCategoryList       //分类推荐列表
//    case liveCateList                //分类列表
//    case getRecList1                 // 热门推荐

}
extension HomeAPI : TargetType {
   
    
    var baseURL: URL {
        switch self {
        case .mCtrl:
            return URL.init(string: "https://mconf.douyucdn.cn")!
        case .getinfo:
            return URL.init(string: "https://rtbapi.douyucdn.cn")!
        case .getSlidesRec:
            return URL.init(string: "https://apiv3.douyucdn.cn")!
        default:
            return URL.init(string: "https://apiv2.douyucdn.cn")!
        }
        
    }
    
    var path: String {
        switch self {
//        case .recommendCategoryList:
//            return "/live/cate/getLiveRecommendCate2"
//        case .liveCateList:
//            return "/live/cate/getLiveCate1List"
//        case .getRecList1:
//            return "/mgapi/livenc/home/getRecList1"
        case .getinfo:
            return "/japi/sign/app/getinfo"
        case .mCtrl:
            return "/resource/common/mCtrl.json"
        case .getSlidesRec:
            return "/mgapi/livenc/mhome/getSlidesRec"
        }
    }
    
    var method: Moya.Method {
        switch self {

        case .getinfo,.getSlidesRec:
            return .post
        case .mCtrl:
            return .get
        }
        
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .mCtrl:
            return .requestParameters(parameters: [:],
                                      encoding: URLEncoding.queryString)
        case .getinfo:
            var params: [String: Any] = baseParam()
            params["client_sys"] = "ios"
            params["mdid"] = "iphone"
            
            print(params)
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.queryString)
        case .getSlidesRec:
            var params: [String: Any] = [:]
            params["client_sys"] = "ios"
            
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.queryString)
//        case .recommendCategoryList:
//            var params: [String: Any] = [:]
//            params["client_sys"] = "ios"
//            return .requestParameters(parameters: params,
//                                      encoding: URLEncoding.default)
//        case .liveCateList:
//            var params: [String: Any] = [:]
//            params["client_sys"] = "ios"
//            return .requestParameters(parameters: params,
//                                      encoding: URLEncoding.default)
//        case .getRecList1:
//            var params: [String: Any] = [:]
//            params["client_sys"] = "ios"
//            params["limit"] = "10"
//            params["offset"] = "0"
//
//            let appDictM : NSMutableDictionary = NSMutableDictionary.init()
//            appDictM.setValue("斗鱼", forKey: "aname")
//            appDictM.setValue("tv.douyu.live", forKey: "pname")
//
//            // device
//            let deviceDictM : NSMutableDictionary = NSMutableDictionary.init()
//            deviceDictM.setValue("750", forKey: "w")
//            deviceDictM.setValue("1334", forKey: "h")
//            deviceDictM.setValue("", forKey: "mac")
//            deviceDictM.setValue("D2501EBB-E442-4168-8D37-E854FD9298C5", forKey: "idfa")
//            deviceDictM.setValue("0", forKey: "devtype")
//            deviceDictM.setValue("12.1", forKey: "osv")
//            deviceDictM.setValue("iOS", forKey: "os")
//            deviceDictM.setValue("", forKey: "imei")
//            deviceDictM.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16B92, Douyu_IOS", forKey: "ua")
//            deviceDictM.setValue("1", forKey: "op")
//            deviceDictM.setValue("1", forKey: "nt")
//            deviceDictM.setValue("iPhone 6", forKey: "model")
//
//            let paramDictM : NSMutableDictionary = NSMutableDictionary.init()
//            paramDictM.setValue(appDictM, forKey: "app")
//            paramDictM.setValue("D2501EBB-E442-4168-8D37-E854FD9298C5", forKey: "idfa")
//            paramDictM.setValue("iphone", forKey: "mdid")
//            paramDictM.setValue(deviceDictM, forKey: "device")
//            paramDictM.setValue("ios", forKey: "client_sys")
//
//            if (!JSONSerialization.isValidJSONObject(paramDictM)) {
//                print("无法解析出JSONString")
//
//            }
//            let data : NSData! = try? JSONSerialization.data(withJSONObject: paramDictM, options: .prettyPrinted) as NSData
//            let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
//
//            params["ad"] = JSONString! as String
//
//            return .requestParameters(parameters: params,
//                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return getHeaders()
    }
}
