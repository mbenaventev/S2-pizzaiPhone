//
//  ViewControllerMasa.swift
//  pizzaiPhone
//
//  Created by Miguel Benavente Valdés on 13/02/16.
//  Copyright © 2016 Miguel Benavente Valdés. All rights reserved.
//

import UIKit

class ViewControllerMasa: UIViewController, UIPickerViewDelegate {
    @IBOutlet weak var lblTamano: UILabel!
    
    @IBOutlet weak var lblMasa: UILabel!
    
    @IBOutlet weak var btnSiguiente: UIButton!
    var tamanoPizza : String = ""
    var masa = ["Delgada", "Crujiente", "Gruesa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMasa.text = masa[0]
        btnSiguiente.enabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        lblTamano.text = tamanoPizza
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamanoSeleccionado : String! = lblTamano.text
        let masaSeleccionada : String! = lblMasa.text
        let siguienteVista = segue.destinationViewController as! ViewControllerQueso
        siguienteVista.tamanoPizza = tamanoSeleccionado
        siguienteVista.masaPizza = masaSeleccionada
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return masa.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return masa[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let masaSeleccionada = masa[row]
        lblMasa.text = masaSeleccionada
        btnSiguiente.enabled = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
