//
//  QuotationIndex.swift
//  QuotationApp
//
//  Created by keisuke kodaka on 2018/02/18.
//  Copyright © 2018年 Keisuke Kodaka. All rights reserved.
//

import UIKit

class QuotationViewController: UIViewController {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var quotationLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuotationDataManager.sharedInstance.loadQuotation()
        let value = QuotationDataManager.sharedInstance.nextQuotation()
        
        quotationLable.text = value.quotationText
        nameLabel.text = value.quotationName
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextQuotationButton(_ sender: Any) {
        let value = QuotationDataManager.sharedInstance.nextQuotation()
        quotationLable.text = value.quotationText
        nameLabel.text = value.quotationName
    }
    
}
