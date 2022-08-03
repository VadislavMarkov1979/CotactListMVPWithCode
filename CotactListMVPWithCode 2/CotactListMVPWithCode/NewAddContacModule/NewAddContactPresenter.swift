//
//  NewAddContactPresenter.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 01.06.2022.
//

import UIKit
/// - интерфейс презентера
protocol NewAddConactPresenterProtocol {
    var viewNewContact: NewAddContactViewProtocol { get set }

    /// - вспомогательный метод для отработки первичной настройки после того как вью загружена в память
    func loadViewNewContact()
    /// - добавить внесенные значения текст филдов в массив
    func addTargetButton()
    /// - проверка заполнения текст филда и отбражения кнопки
    func textFieldChanged()
}

final class NewAddContactPresenter: NewAddConactPresenterProtocol {
    /// - вью экрана NewAddConact
	var viewNewContact: NewAddContactViewProtocol

    /// - презентер NewAddConact
    var presenterContactList: ContactListPresenterProtocol?
	var persons: [Person]?
    
    /// - инициализатор
    /// - parameter viewNewContact - вью экрана ViewNewContact
	init(viewNewContact: NewAddContactViewProtocol) {
		self.viewNewContact = viewNewContact
	}
    
    func loadViewNewContact() {
		persons = presenterContactList?.persons
//        persons = StorageManager.shared.fetchContacts()
        viewNewContact.setNewContactView()
        viewNewContact.setNavBar()
        viewNewContact.buttonSave.isEnabled = false
        addTargetButton()
        addTargetCell()
    }
    
    func addTargetButton() {
        viewNewContact.buttonSave.addTarget(self, action: #selector(checIllegalDouble), for: .touchUpInside)
    }
    
    func addTargetCell() {
        viewNewContact.fieldName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc func checIllegalDouble() -> Bool {
        guard let textFieldDouble = viewNewContact.fieldPhone.text else { return false }
        let checIllegal = Double(textFieldDouble)
        if checIllegal == nil {
            /// - ззапустить алерт на вью контроллере
            viewNewContact.showAlert(with: Texts.alertTitle.rawValue, massege: Texts.alertMasseg.rawValue)
            return false
        }
        addNewContact()
        return true
    }
    
    /// - проверка заполения текстфилда на заполнение и активация кнопки
    @objc func textFieldChanged() {
        guard let name = viewNewContact.fieldName.text else { return }
        viewNewContact.buttonSave.isEnabled = !name.isEmpty ? true : false
//        if viewNewContact.fieldName.text?.isEmpty == false {
//            viewNewContact.buttonSave.isEnabled = true
//        } else {
//            viewNewContact.buttonSave.isEnabled = false
//        }
    }
    
    /// - добавление значений в текстфилдах в массив
    func addNewContact() {
        guard let name = viewNewContact.fieldName.text else { return }
        guard let surname = viewNewContact.fieldSurname.text else { return }
        guard let phone = viewNewContact.fieldPhone.text else { return }
        
        let person = Person(
            name: name,
            surname: surname,
            phone: phone
        )
        presenterContactList?.addPerson(person: person)
//		persons?.append(person)
		
        /// - переход на экран ContactList
        viewNewContact.navigationController?.popViewController(animated: true)
    }
}
