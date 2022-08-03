//
//  ContactListView.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 26.05.2022.
//

import UIKit

/// - интерфейс вью первого экрана
protocol ContactListViewProtocol: Any {
    var parentContactList: UITableView? { get set }
    var navigationController: UINavigationController? { get set }
    var navBar: UINavigationItem? { get set }
    /// - настрока вью первого экрана
    func setupView()
    func setupNavBar()
    
}
/// - класс TableView первого экрана
final class ContactListView: ContactListViewProtocol {
    
    var parentContactList: UITableView?
    /// - навигейшн контроллер первого экрана
    var navigationController: UINavigationController?
    /// - элемент навигейшн бара
    var navBar: UINavigationItem?

    func setupView() {
        /// - регитсрация ячейки в таблице первого экрана
        parentContactList?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        /// - установка цвета фона первого экрана
        parentContactList?.backgroundColor = .white
    }
    
    func setupNavBar() {
        /// - установка текста в навигейшн баре
        navBar?.title = Texts.titleContactBar.rawValue
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        /// - установка фонового цвета навигейшн бара
        navBarAppearance.backgroundColor = Colors.bacgroundBar.value
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        navBar?.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: #selector(addNewContact)
//        )
        /// - цвет текста в навигейшн баре
        navigationController?.navigationBar.tintColor = .white
    }
    
	/// этот метод должен быть в презентере иначе как ты передать сможешь данные?
//    @objc func addNewContact(_ sender: UIBarButtonItem) {
//        let view = NewAddContactView(parentView: UIView())
//        let presenter = NewAddContactPresenter(viewNCV: view)
//        let newAddVC = NewAddContactViewController(presenterNCV: presenter)
//        newAddVC.presenterNCV = presenter
//        self.navigationController?.pushViewController(newAddVC, animated: true)
//    }
}
