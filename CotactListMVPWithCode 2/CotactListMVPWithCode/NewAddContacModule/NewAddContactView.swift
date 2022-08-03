//
//  NewAddContactView.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 01.06.2022.
//

import UIKit
/// - интерфейс экрана NewAddContact
protocol NewAddContactViewProtocol {
    /// - вью экрана NewAddContact
    var parentView: UIView { get set }
    /// - навигейшн контроллер экрана NewAddContact
    var navigationController: UINavigationController? { get set }
    /// - навигейшн бар контроллера
    var navBar: UINavigationItem? { get set }
    /// - кнопка сохранить внесенные данные в поля
    var buttonSave: UIButton { get }
    /// - текст филды экрана NewAddContact
    var fieldName: UITextField { get }
    var fieldSurname: UITextField { get }
    var fieldPhone: UITextField { get }
    
    /// - настройка экрана NewAddContact
    func setNewContactView()
    /// - настройка навигейшн бара
    func setNavBar()
    /// - установка констрейнтов NewAddContact
    func setConstrains()
    /// - алерт ошибки ввода данных в текстфилд Телефон
    /// - parameter title: - загаловок алерта
    /// - parameter massege: - сообщение на экране алерта
    func showAlert(with title: String, massege: String)
}

final class NewAddContactView: NewAddContactViewProtocol {
    /// - вью экрана NewAddContact
	var parentView: UIView

    /// - инициализатор
	init(parentView: UIView) {
		self.parentView = parentView
	}
    
    var navigationController: UINavigationController?
    var navBar: UINavigationItem?
    
    /// - текст филд Имени
    var fieldName: UITextField = {
        let tfName = UITextField()
        tfName.translatesAutoresizingMaskIntoConstraints = false
        tfName.textColor = Colors.textPrimary.value
        tfName.borderStyle = .roundedRect
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 20))
        tfName.leftView = paddingView
        tfName.leftViewMode = .always
        let placeholderText = NSAttributedString(
            string: Texts.placeholderTFName.rawValue,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.textSecondary.value])
        tfName.attributedPlaceholder = placeholderText
        tfName.layer.cornerRadius = 15
        return tfName
    }()
    
    /// - текст филд Фамилии
    var fieldSurname: UITextField = {
        let tfSurname = UITextField()
        tfSurname.translatesAutoresizingMaskIntoConstraints = false
        tfSurname.textColor = Colors.textPrimary.value
        tfSurname.borderStyle = .roundedRect
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 20))
        tfSurname.leftView = paddingView
        tfSurname.leftViewMode = .always
        let placeholderText = NSAttributedString(
            string: Texts.placeholderTFSurname.rawValue,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.textSecondary.value])
        tfSurname.attributedPlaceholder = placeholderText
        tfSurname.layer.cornerRadius = 15
        return tfSurname
    }()
    
    /// - текст филд Телефона
    var fieldPhone: UITextField = {
        let tfPhone = UITextField()
        tfPhone.translatesAutoresizingMaskIntoConstraints = false
        tfPhone.textColor = Colors.textPrimary.value
        tfPhone.borderStyle = .roundedRect
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 20))
        tfPhone.leftView = paddingView
        tfPhone.leftViewMode = .always
        let placeholderText = NSAttributedString(
            string: Texts.placeholderTFPhone.rawValue,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.textSecondary.value])
        tfPhone.attributedPlaceholder = placeholderText
        tfPhone.layer.cornerRadius = 15
        return tfPhone
    }()
    
    /// - кнопка Сохранить
    var buttonSave: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 22)
        button.backgroundColor = Colors.bacgroundBar.value
        button.tintColor = Colors.textButton.value
        button.setTitle(Texts.textButton
            .rawValue, for: .normal)
        button.setTitle("", for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setNewContactView() {
        parentView.backgroundColor = .white
        parentView.addSubview(fieldName)
        parentView.addSubview(fieldSurname)
        parentView.addSubview(fieldPhone)
        parentView.addSubview(buttonSave)
        setConstrains()
    }

    func setNavBar() {
        navBar?.title = Texts.titleNewAddBar.rawValue
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = Colors.bacgroundBar.value
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController?.navigationBar.tintColor = Colors.textButton.value
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            buttonSave.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -40),
            buttonSave.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            buttonSave.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            buttonSave.heightAnchor.constraint(equalToConstant: 60),
            
            fieldName.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 200),
            fieldName.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            fieldName.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            fieldName.heightAnchor.constraint(equalToConstant: 40),
            
            fieldSurname.topAnchor.constraint(equalTo: fieldName.bottomAnchor, constant: 20),
            fieldSurname.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            fieldSurname.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            fieldSurname.heightAnchor.constraint(equalToConstant: 40),

            fieldPhone.topAnchor.constraint(equalTo: fieldSurname.bottomAnchor, constant: 20),
            fieldPhone.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            fieldPhone.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            fieldPhone.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    /// - показать алерт если неправильно введены данные в текстфилд Телефон
    func showAlert(with title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let action = UIAlertAction(title: Texts.alertOK.rawValue, style: .destructive, handler: nil)
        
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true)
    }
}
