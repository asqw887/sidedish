//
//  FoodManager.swift
//  sideDish
//
//  Created by 최예주 on 2022/04/25.
//

import Foundation

class FoodManager{
    
    let category = ["main", "soup", "side"]
    
    private(set) var mainFood: [Food]?
    private(set) var soupFood: [Food]?
    private(set) var sideFood: [Food]?
    
    init(){
        foodLoadData()
    }
    
    func foodLoadData(){
        // Todo: API로 요청 -> 실패시 mockup data 로 데이터 가져오도록
        
        NetworkManager.getRequest(url: "https://api.codesquad.kr/onban/main") { data in
            guard let result: Response = JsonConvertor.decodeJson(data: data) else { return }
            self.mainFood = result.body
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Main"), object: self)
        }
        
        soupFood = JsonConvertor.mockLoad(file: "soup")
        sideFood = JsonConvertor.mockLoad(file: "side")
    }
}
