//
//  ViewController.swift
//  IAPExampleProject
//
//  Created by Parker McLain on 1/21/21.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKProductsRequestDelegate {
    @IBOutlet var statusLabel: UILabel!
    
    private var productsRequest: SKProductsRequest!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fetchClicked(_ sender: Any) {
        print("Fetch clicked")
        statusLabel.textColor = .black
        statusLabel.text = "Fetching ..."
        
        let productIdentifiers = Set(["com.parker.IAPExampleProject.yearly"])

        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        print("Reset clicked")
        statusLabel.text = ""
    }
    

    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.statusLabel.textColor = .red
            self.statusLabel.text = "Request Failed!"
        }
        
        print("SKRequest Failed")
        print("Error: \(error)")
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.statusLabel.textColor = .green
            self.statusLabel.text = "Request Successful!"
        }
        
        print("SKRequest Successful")
    }
}

