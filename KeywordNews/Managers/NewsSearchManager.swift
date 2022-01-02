//
//  NewsSearchManager.swift
//  KeywordNews
//
//  Created by yc on 2022/01/02.
//

import Foundation
import Alamofire

struct NewsSearchManager {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
        
        let parameters = NewsRequestModel(
            start: start,
            display: display,
            query: keyword
        )
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "X_RhhFdos_T8XyYZbYq7",
            "X-Naver-Client-Secret": "1Iq3eupG69"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NewsResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
        
    }
}
