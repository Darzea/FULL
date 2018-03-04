//
//  QRViewController.swift
//  Flash Chat
//
//  Created by Darragh Meaney on 01/02/2018.
//  
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var codeSelector: UISegmentedControl!
    
    @IBOutlet weak var displayCodeView: UIImageView!
    
    var filter:CIFilter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func generatePressed(_ sender: Any) {
        
        if let text = dataField.text {
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if codeSelector.selectedSegmentIndex == 0 {
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            }else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            displayCodeView.image = image
        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
