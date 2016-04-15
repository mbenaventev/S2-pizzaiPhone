//
//  ViewControllerIngredientes.swift
//  pizzaiPhone
//
//  Created by Miguel Benavente Valdés on 17/02/16.
//  Copyright © 2016 Miguel Benavente Valdés. All rights reserved.
//

import UIKit

class ViewControllerIngredientes: UIViewController, UIPickerViewDelegate, UITableViewDelegate{

    @IBOutlet weak var lblTamano: UILabel!
    @IBOutlet weak var lblMasa: UILabel!
    @IBOutlet weak var lblQueso: UILabel!
    @IBOutlet weak var btnSiguiente: UIButton!
    @IBOutlet weak var lblIngredientesSeleccionados: UITextView!
    @IBOutlet weak var btnSi: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var lblMensaje: UILabel!
    @IBOutlet weak var pickIngredientes: UIPickerView!
    

    
    
    
    var tamanoPizza : String = ""
    var masaPizza : String = ""
    var quesoPizza : String = ""
    
    var ingredientes = ["Jamón Peperoni", "Pavo", "Parmesano", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    var ingredientesSeleccionados : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSiguiente.enabled = false
        lblIngredientesSeleccionados.text = ""
        lblMensaje.hidden = true
        btnSi.hidden = true
        btnNo.hidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        lblTamano.text = tamanoPizza
        lblMasa.text = masaPizza
        lblQueso.text = quesoPizza
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return ingredientes.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return ingredientes[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        //let quesoSeleccionado = ingredientes[row]
        //lblQueso.text = quesoSeleccionado
        //btnSiguiente.enabled = true
        let ingredienteSeleccionado = ingredientes[row]
        if ingredientesSeleccionados.count < 5
        {
        ingredientesSeleccionados.append(ingredienteSeleccionado)
        lblIngredientesSeleccionados.text = lblIngredientesSeleccionados.text! + "\n " + String(ingredienteSeleccionado)
            
            if ingredientesSeleccionados.count == 5
            {
                lblMensaje.hidden = false
                btnSi.hidden = false
                btnNo.hidden = false
                pickIngredientes.userInteractionEnabled = false
            }
            
        }else
        {
            lblMensaje.hidden = false
            btnSi.hidden = false
            btnNo.hidden = false
        }
        
    }
    
    @IBAction func btnSiCambiar(sender: AnyObject) {
        ingredientesSeleccionados=[]
        lblIngredientesSeleccionados.text = ""
        lblMensaje.hidden = true
        btnSi.hidden = true
        btnNo.hidden = true
        pickIngredientes.userInteractionEnabled = true
    }
    @IBAction func btnNoCambiar(sender: AnyObject) {
        lblMensaje.hidden = true
        btnSi.hidden = true
        btnNo.hidden = true
        btnSiguiente.enabled = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamanoSeleccionado : String! = lblTamano.text
        let masaSeleccionada : String! = lblMasa.text
        let quesoSeleccionado : String! = lblQueso.text
        let ingredientesSeleccionado : String! = lblIngredientesSeleccionados.text
        let siguienteVista = segue.destinationViewController as! ViewController_Cocinar
        siguienteVista.tamanoPizza = tamanoSeleccionado
        siguienteVista.masaPizza = masaSeleccionada
        siguienteVista.quesoPizza = quesoSeleccionado
        siguienteVista.ingredientesPizza = ingredientesSeleccionado
    }
    @IBAction func ReHacer(sender: UIButton) {
        //ViewController.showViewController(ViewController)
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
