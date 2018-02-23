//
//  QuotationMoneyData.swift
//  QuotationApp
//
//  Created by keisuke kodaka on 2018/02/20.
//  Copyright © 2018年 Keisuke Kodaka. All rights reserved.
//

import Foundation

class QuotationMoneyData {
    //名言文
    var quotationText: String
    //名前
    var quotationName: String
    
    //クラス生成時の処理
    init(quotationSourceDataArray: [String]) {
        quotationText = quotationSourceDataArray[0]
        quotationName = quotationSourceDataArray[1]
    }
}

class QuotationMoneyDataManager {
    
    static let sharedInstance = QuotationMoneyDataManager()
    
    //名言と名前を格納する為の配列
    var quotationDataArray = [QuotationMoneyData]()
    
    private init() {
        
    }
    
    func loadQuotation() {
        
        guard let csvFilePath = Bundle.main.path(forResource: "money",
                                                 ofType: "csv") else {
                                                    print("csvファイルがありません")
                                                    return
        }
        
        //csv読み込み
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath,
                                           encoding: String.Encoding.utf8)
            //１行ずつ読み込み
            csvStringData.enumerateLines(invoking: { (line, stop) in
                let quotationSourceDataArray = line.components(separatedBy: ",")
                //問題データを格納するオブジェクト
                let quotationData = QuotationMoneyData(quotationSourceDataArray: quotationSourceDataArray)
                self.quotationDataArray.append(quotationData)
            })
        } catch let error as NSError {
            print("読み込みエラー")
        }
    }
    
    func nextQuotation() -> QuotationMoneyData {
        let firstQuotationIndex = Int(arc4random_uniform(50))
        let nextQuotation = quotationDataArray[firstQuotationIndex]
        return nextQuotation
    }
}
