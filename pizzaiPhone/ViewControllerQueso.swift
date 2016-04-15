//
//  ViewControllerQueso.swift
//  pizzaiPhone
//
//  Created by Miguel Benavente Valdés on 14/02/16.
//  Copyright © 2016 Miguel Benavente Valdés. All rights reserved.
//

import UIKit

class ViewControllerQueso: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var lblTamano: UILabel!
    
    @IBOutlet weak var lblMasa: UILabel!
    
    @IBOutlet weak var lblQueso: UILabel!
    
    @IBOutlet weak var btnSiguiente: UIButton!

    var tamanoPizza : String = ""
    var masaPizza : String = ""
    var queso = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblQueso.text = queso[0]
        btnSiguiente.enabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        lblTamano.text = tamanoPizza
        lblMasa.text = masaPizza
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamanoSeleccionado : String! = lblTamano.text
        let masaSeleccionada : String! = lblMasa.text
        let quesoSeleccionado : String! = lblQueso.text
        let siguienteVista = segue.destinationViewController as! ViewControllerIngredientes
        siguienteVista.tamanoPizza = tamanoSeleccionado
        siguienteVista.masaPizza = masaSeleccionada
        siguienteVista.quesoPizza = quesoSeleccionado
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return queso.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return queso[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let quesoSeleccionado = queso[row]
        lblQueso.text = quesoSeleccionado
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
