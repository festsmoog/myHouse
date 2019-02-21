//
//  typeHouseTableViewController.swift
//  myHouse
//
//  Created by Valera Petin on 12.03.17.
//  Copyright © 2017 Valery Petin. All rights reserved.
//

import UIKit

class TypeHouseTableViewController: UITableViewController {
    
    var typeHouses:[String] = [
        "Бизнс-класс",
        "Гостинка",
        "Двухуравневая",
        "Другой",
        "Индивидуальная",
        "Ленинградская",
        "Малосемейка",
        "Новая",
        "Пентагон",
        "Пентхаус",
        "Полногабаритная",
        "Студия",
        "Типовая",
        "Улучшенной планировки",
        "Эконом-класс",
        "Элитная"]
    
    var selectedtypeHouse:String? {
        didSet {
            if let typeHouse = selectedtypeHouse {
                selectedtypeHouseIndex = typeHouses.index(of: typeHouse)
            }
        }
    }
    var selectedtypeHouseIndex:Int?
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeHouses.count
    }
    
    //хранение имени и индекса выбраной ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeHouseCell", for: indexPath)
        cell.textLabel?.text = typeHouses[indexPath.row]
        
        //выбор элемента (галочка)
        if indexPath.row == selectedtypeHouseIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    //выбор строки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Если выбрана другая строчка - нужно отменить выбор
        if let index = selectedtypeHouseIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedtypeHouse = typeHouses[indexPath.row]
        
        //обновить выбор для нужной строки
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSelectedtypeHouse" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    selectedtypeHouse = typeHouses[index]
                }
            }
        }
    }
    
}
