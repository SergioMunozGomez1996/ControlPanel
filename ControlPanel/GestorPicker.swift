//
//  GestorPicker.swift
//  ControlPanel
//
//  Created by Máster Móviles on 31/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation
import UIKit

class GestorPicker : NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var lista = ["Saturno", "M13", "Nebulosa de Orión", "Narnia"]

    //METODOS DE  UIPickerViewDataSource gestiona el "modelo de datos": cuántas filas y columnas tiene
    //número de "columnas" del Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //número de "filas"
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lista.count
    }

    //METODOS DE UIPickerViewDelegate gestiona el comportamiento general del picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lista[row]
    }
    
    //Detectar que se ha seleccionado un valor distinto en el picker. En el delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Seleccionada fila: \(row), dato: \(lista[row])")
    }
}
