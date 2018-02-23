//
//  QuotationData.swift
//  QuotationApp
//
//  Created by keisuke kodaka on 2018/02/18.
//  Copyright © 2018年 Keisuke Kodaka. All rights reserved.
//

import Foundation

class QuotationData {
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

class QuotationDataManager {
    
    static let sharedInstance = QuotationDataManager()
    
    //名言と名前を格納する為の配列
    var quotationDataArray = [QuotationData]()
    
    private init() {
        
    }
    
    func loadQuotation() {
        
        guard let csvFilePath = Bundle.main.path(forResource: "quotation",
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
                let quotationData = QuotationData(quotationSourceDataArray: quotationSourceDataArray)
                self.quotationDataArray.append(quotationData)
            })
        } catch let error as NSError {
            print("読み込みエラー")
        }
}
    
    func nextQuotation() -> QuotationData {
        let firstQuotationIndex = Int(arc4random_uniform(50))
        let nextQuotation = quotationDataArray[firstQuotationIndex]
        return nextQuotation
    }
}

