//
//  FormViewController.swift
//  ImageRecognition
//
//  Created by Luiz Henrique Monteiro de Carvalho on 03/06/20.
//  Copyright © 2020 Luiz Henrique Monteiro de Carvalho. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var catTextField: UITextField!
    @IBOutlet weak var dogTextField: UITextField!
    @IBOutlet weak var fishTextField: UITextField!
    @IBOutlet weak var pigTextField: UITextField!
    @IBOutlet weak var ratTextField: UITextField!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var fishLabel: UILabel!
    @IBOutlet weak var ratLabel: UILabel!
    @IBOutlet weak var pigLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        catLabel.text = ""
        dogLabel.text = ""
        fishLabel.text = ""
        ratLabel.text = ""
        pigLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func verifyBttn(_ sender: Any) {
        if catTextField.text != "gato"{
            catLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            catLabel.text = "Errado"
        } else if catTextField.text == "gato"{
            catLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            catLabel.text = "Correto"
        }
        
        if dogTextField.text != "cachorro"{
            dogLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            dogLabel.text = "Errado"
        } else if dogTextField.text == "cachorro"{
            dogLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            dogLabel.text = "Correto"
        }
        
        if fishTextField.text != "peixe"{
            fishLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            fishLabel.text = "Errado"
        } else if fishTextField.text == "peixe"{
            fishLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            fishLabel.text = "Correto"
        }
        
        if pigTextField.text != "porco"{
            pigLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            pigLabel.text = "Errado"
        } else if pigTextField.text == "porco"{
            pigLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            pigLabel.text = "Correto"
        }
        
        if ratTextField.text != "rato"{
            ratLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            ratLabel.text = "Errado"
        } else if ratTextField.text == "rato"{
            ratLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            ratLabel.text = "Correto"
        }
        
    }
    

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
