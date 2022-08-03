//
//  ContactListPresenter.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 26.05.2022.
//

import UIKit
/// - интерфейс презентера первого экрана
protocol ContactListPresenterProtocol {
    /// - вью рвого экрана
    var view: ContactListViewProtocol { get set }
    /// - массив данных модели
    var persons: [Person] { get set }
    /// - количество элементов в массиве данных
    var contactCount: Int { get }
    /// - вспомогательный метод для отработки первичной настройки после того как вью загружена в память
    func viewLoad()
    /// - добавление данных в массив
    func addPerson(person: Person)
    /// - индекс элемента в массиве
    func personIndex(at index: Int) -> Person
}

final class ContactListPresenter: ContactListPresenterProtocol{
 
    var view: ContactListViewProtocol = ContactListView()
    var persons: [Person] = []
    
    
    func viewLoad() {
        view.setupView()
        view.setupNavBar()
        /// - установка кнопки Добавить новый контакт в навигейшн баре
		view.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .add,
			target: self,
			action: #selector(addNewContact)
		)
    }
    
    var contactCount: Int {
       return persons.count
        
    }
/// - добавление новых значений в модель
/// - если новое значение name и phone равны, новые данные не добавляются
    func addPerson(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
            StorageManager.shared.save(contact: person)
        }
    }
    
    func personIndex(at index: Int) -> Person {
        return persons[index]
    }

	@objc func addNewContact(_ sender: UIBarButtonItem) {
		gotoNew()
	}
    /// - переход на экран добаления контактов по тапу на кнопку add
	func gotoNew() {
		let NewAddview = NewAddContactView(parentView: UIView())
        let presenter = NewAddContactPresenter(viewNewContact: NewAddview)
		presenter.presenterContactList = self
		let newAddVC = NewAddContactViewController(presenterNCV: presenter)
		view.navigationController?.pushViewController(newAddVC, animated: true)
	}
}
