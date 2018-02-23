//
//  WorkView.Controller.swift
//  QuotationApp
//
//  Created by keisuke kodaka on 2018/02/20.
//  Copyright © 2018年 Keisuke Kodaka. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    
    
    @IBOutlet weak var quotationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuotationWorkDataManager.sharedInstance.loadQuotation()
        let value = QuotationWorkDataManager.sharedInstance.nextQuotation()
        
        quotationLabel.text = value.quotationText
        nameLabel.text = value.quotationName
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextQuotationButton(_ sender: Any) {
        let value = QuotationWorkDataManager.sharedInstance.nextQuotation()
        quotationLabel.text = value.quotationText
        nameLabel.text = value.quotationName
    }
    
}
