//
//  ViewController.swift
//  ControlPanel
//
//  Created by Máster Móviles on 31/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var levelSlide: UILabel!
    @IBOutlet weak var emergenciaButton: UIButton!
    @IBOutlet weak var estadoSwitchLabel: UILabel!
    
    let gestorPicker = GestorPicker()
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.levelSlide.text = String(Int(self.slider.value))
        self.picker.delegate = self.gestorPicker
        self.picker.dataSource = self.gestorPicker
        // Do any additional setup after loading the view.
    }

    @IBAction func introTap(_ sender: Any) {
        self.view.endEditing(true)
        textView.text.append(self.editText.text!+"\n")
        self.editText.text = ""
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        self.levelSlide.text = String(Int(sender.value))
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Opciones",
            message: "Seleccione la opción",
            preferredStyle: .actionSheet)
        let archivar = UIAlertAction(title: "Nave salvavidas", style: .default){
                    action in
                    print("Se han lanzado naves salvavidas")
        }
        let eliminar = UIAlertAction(title: "Hiperespacio", style: .default) {
                    action in
                    print("Se ha abierto compuerta hacia el hiperespacio")
                }
        let cancelar = UIAlertAction(title: "Autodestrucción", style: .destructive) {
                    action in
                    print("Creo que estás muerto")
        }
        actionSheet.addAction(archivar)
        actionSheet.addAction(eliminar)
        actionSheet.addAction(cancelar)
        self.present(actionSheet, animated: true) {
           print("Se ha mostrado toda la alerta")
        }
    }
    
    @IBAction func switchTap(_ sender: UISwitch) {
        if(sender.isOn){
            self.emergenciaButton.isEnabled = true
            self.estadoSwitchLabel.text = "Control emergencia activo"
        }else{
            self.emergenciaButton.isEnabled = false
            self.estadoSwitchLabel.text = "Control emergencia inactivo"
        }
    }
    
}

