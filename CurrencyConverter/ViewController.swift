//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by EBRU KÖSE on 1.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        //1. request &session
        //2. response&data
       //3. parsing&json serialization
        
        
        
        //1. adım
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert
                )
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse =  try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
//ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = " CAD :\(cad) "
                                    
                                }
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = " CAD :\(cad) "
                                    
                                }
                                
                                
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = " USD :\(usd) "
                                    
                                }
                                
                            }
                        }


                    } catch{
                        print("error")
                    }
                    
                }
            }
        }
        task.resume()
        
    }
}

