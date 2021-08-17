//
//  BaseAPI.swift
//  douyu
//
//  Created by James on 2021/8/16.
//

import Foundation


func getHeaders() ->[String : String]? {
    // 配置 HTTPHeaders
    let headers: [String : String] = [
//        "charset":"utf-8",
//        "Cookies" : "acf_did=3ee82da474009d4e89ced25300001621",
//        "User-Device": "NjQxMmY2NmM4M2EzMjJlOTBmYTMzMDdkMDAwMDE1MjF8NS4wMDA=",
//        "time" : getTimeStamp(),
//        "auth" : "75ea4857b35447e346aded6ef83b322f",
//        "aid"  : "ios",
//        "User-Agent" : "ios/7.111 (ios 12.1.2; ; iPhone 6s (A1633/A1688/A1691/A1700))",
//        "Accept-Encoding" : "br, gzip, deflate",
//        "Content-Type" : "application/x-www-form-urlencoded",
//        "Transfer-Encoding":"chunked",
//        "x-dy-traceid": "3b81f458613955f3:3b81f458613955f3:0:013758",
//        "TTR": "TTR"
//
//

        "TTR": "TTR",
        "Accept-Language": "zh-Hans-CN;q=1",
        "time":    getTimeStamp(),
        "auth": "75ea4857b35447e346aded6ef83b322f",
        "User-Agent":    "ios/7.111 (ios 12.1.2; ; iPhone 6s (A1633/A1688/A1691/A1700))",
        "aid":    "ios",
        "x-dy-traceid": "65526249c4050cb2:65526249c4050cb2:0:016246",
        "user-device": "M2VlODJkYTQ3NDAwOWQ0ZTg5Y2VkMjUzMDAwMDE2MjF8Ny4xMTE=",
        "Content-Type":    "application/x-www-form-urlencoded",
        "Cookie":   "acf_did=3ee82da474009d4e89ced25300001621",
        "Accept-Encoding":  "gzip",
        "Transfer-Encoding":    "chunked",
        "charset": "utf-8"
//        Connection    keep-alive
        ]
    return headers
}

func baseParam() ->  [String: Any] {
//    print(identifier)
    return [
        "aaid":"0",
        "app": ["aname" :"斗鱼","paname":"tv.douyu.live"],
        "idfa": identifier,
        "device":deviceParam(),
        "posid":"319103,319102",
        "roomid":"0",
    ]
}

func deviceParam() ->  [String: Any] {
    return [
        "caid": "00_48ADA53A066D1B5CABEDF979ECA2A608_DCE7106EB19B4D9FDD0273620CE5D1E8",
        "w": kScreenW,
        "h": kScreenH,
        "idfa": identifier,
        "os": "iOS",
        "mac": "020000000000",
        "devtype": "0",
        "osv": device_system_version,
        "aaid":"",
        "imei":"",
        "ua":"Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16C101, Douyu_IOS",
        "op":"2",
        "model":device_model_name,
        "nt":"1",
        "mfrs":"apple",
    ]
}

func getTimeStamp() -> String {
    //获取当前时间
    let now = NSDate()
    //当前时间的时间戳
    let timeInterval : TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}
