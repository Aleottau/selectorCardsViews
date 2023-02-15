//
//  DataManager.swift
//  SelectorCardModule
//
//  Created by alejandro on 6/02/23.
//

import Foundation
protocol DataManagerProtocol {
    func processCardData(fileName: String, dataExtension: String) -> CardDataModel?
}
class DataManager {
}
extension DataManager: DataManagerProtocol {
    func processCardData(fileName: String, dataExtension: String) -> CardDataModel? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: dataExtension) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let modelData = try JSONDecoder().decode(CardDataModel.self, from: data)
            return modelData
        } catch let error {
            print("error \(error.localizedDescription)")
            return nil
        }
    }
    
    
}
