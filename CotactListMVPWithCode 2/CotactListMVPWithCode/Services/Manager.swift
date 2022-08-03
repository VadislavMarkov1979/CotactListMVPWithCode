//
//  Manager.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 18.06.2022.
//

import Foundation

/// - класс менеджер хранилища
class StorageManager {
    /// - экземпляр класса хранилища
    static let shared = StorageManager()
    
    /// - создаем экземпляр, что бы не писать каждый раз UserDefaults.standard
    private let userDefaults = UserDefaults.standard
    private let key = "contacts"
    
    /// - делаем класс синглтоном
    private init() {}
    
    /// - сохранение данных в память
    /// - parameter Person - модель данных
    /// - для сохранения данных в юзер дефолт, необходимо восстановить из юзер дефолт данные fetchContacts()
    /// - сохраняем в contact
    /// - кодируем данные Person в data
    func save(contact: Person) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().self.encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    /// - восстанавливаем записанный массив из памяти
    /// - приводим userDefaults.object до типа Data
    /// - декодируем из data в Person
    func fetchContacts() -> [Person] {
        guard let data = userDefaults.object(forKey: key) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Person].self, from: data) else { return [] }
        return contacts
    }
    
    /// - удаление данных из памяти
    /// - parameter Person - модель данных
    /// - для удаления данных из юзер дефолт, необходимо восстановить из юзер дефолт данные fetchContacts()
    /// - удаляем из contact
    /// - кодируем данные Person в data
    /// - сохраняем измененные данные в data
    func deleteContacts(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().self.encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
