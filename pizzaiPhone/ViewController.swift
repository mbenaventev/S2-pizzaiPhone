//
//  ViewController.swift
//  pizzaiPhone
//
//  Created by Miguel Benavente Valdés on 13/02/16.
//  Copyright © 2016 Miguel Benavente Valdés. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var lblTamanoSeleccionado: UILabel!
    
    @IBOutlet weak var btnSiguiente: UIButton!
    
    var tamano = ["Chica", "Mediana", "Grande"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTamanoSeleccionado.text = tamano[0]
        btnSiguiente.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamanoSeleccionado : String! = lblTamanoSeleccionado.text!
        let siguienteVista = segue.destinationViewController as! ViewControllerMasa
        siguienteVista.tamanoPizza = tamanoSeleccionado
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return tamano.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return tamano[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
    let tamanoSeleccionado = tamano[row]
        lblTamanoSeleccionado.text = tamanoSeleccionado
        btnSiguiente.enabled = true
        
    }

}

