//
//  DetailContactView.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 02.06.2022.
//

import UIKit
/// - интерфейс вью экрана DetailViewContact
protocol DetailContactViewProtocol {
    /// - вью экрана DetailViewContact
	var parentDetailViewController: UIView { get set }
    /// - навигейшн контроллер
	var navigationDetailViewController: UINavigationController? { get set }
    /// - навигейшн бар
	var navBarDetailViewController: UINavigationItem? { get set }
    /// - лэйбл экрана DetailViewContact
    var labelName: UILabel { get }
    var labelSurname: UILabel { get }
    var labelPhone: UILabel { get }
    
    /// - установить навигейшн бар
	func setNavBarDetailViewController()
    /// - настройка экрана DetailViewContact
    func setDetailContactView()
    /// - установить констрейнты DetailViewContact
    func setConstrains()
}

final class DetailContactView: DetailContactViewProtocol {
    
    var parentDetailViewController: UIView
    var navigationDetailViewController: UINavigationController?
    var navBarDetailViewController: UINavigationItem?

    
    init(parentDVC: UIView){
        self.parentDetailViewController = parentDVC
    }
    /// - лэйбл имени
    var labelName: UILabel = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont(name: "Avenir", size: 20)
        labelName.numberOfLines = 0
        labelName.textColor = Colors.textPrimary.value
        return labelName
    }()
    /// - лэйбл фамилия
    var labelSurname: UILabel = {
        let labelSuname = UILabel()
        labelSuname.translatesAutoresizingMaskIntoConstraints = false
        labelSuname.font = UIFont(name: "Avenir", size: 20)
        labelSuname.numberOfLines = 0
        labelSuname.textColor = Colors.textPrimary.value
      
        return labelSuname
    }()
    /// - лэйбл телефон
    var labelPhone: UILabel = {
        let labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        labelPhone.font = UIFont(name: "Avenir", size: 20)
        labelPhone.numberOfLines = 0
        labelPhone.textColor = Colors.textPrimary.value
        return labelPhone
    }()
    
    
    func setDetailContactView() {
        parentDetailViewController.backgroundColor = .white
        parentDetailViewController.addSubview(labelName)
        parentDetailViewController.addSubview(labelSurname)
        parentDetailViewController.addSubview(labelPhone)
        setConstrains()
    }
    
    func setNavBarDetailViewController() {
        navBarDetailViewController?.title = Texts.titleDetailBar.rawValue
        navigationDetailViewController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = Colors.bacgroundBar.value
        
        navigationDetailViewController?.navigationBar.standardAppearance = navBarAppearance
        navigationDetailViewController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationDetailViewController?.navigationBar.tintColor = Colors.textButton.value
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            
            labelName.topAnchor.constraint(equalTo: parentDetailViewController.safeAreaLayoutGuide.topAnchor, constant: 130),
            labelName.leadingAnchor.constraint(equalTo: parentDetailViewController.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: parentDetailViewController.trailingAnchor, constant: -16),
            labelName.heightAnchor.constraint(equalToConstant: 40),
            
            labelSurname.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            labelSurname.leadingAnchor.constraint(equalTo: parentDetailViewController.leadingAnchor, constant: 16),
            labelSurname.trailingAnchor.constraint(equalTo: parentDetailViewController.trailingAnchor, constant: -16),
            labelSurname.heightAnchor.constraint(equalToConstant: 40),

            labelPhone.topAnchor.constraint(equalTo: labelSurname.bottomAnchor, constant: 20),
            labelPhone.leadingAnchor.constraint(equalTo: parentDetailViewController.leadingAnchor, constant: 16),
            labelPhone.trailingAnchor.constraint(equalTo: parentDetailViewController.trailingAnchor, constant: -16),
            labelPhone.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
