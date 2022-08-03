//
//  ContactListViewController.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 26.05.2022.
//

import UIKit
/// - Вьюконтроллер первого экрана
class ContactListViewController: UITableViewController {
    /// - презентер первого экрана
    var presenter: ContactListPresenterProtocol?
    
    /// - Инициализатор
    init(presenter: ContactListPresenterProtocol){
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.view.parentContactList = tableView
        presenter?.view.navigationController = navigationController
        presenter?.view.navBar = navigationItem
        presenter?.viewLoad()
		presenter?.view.parentContactList?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.persons = StorageManager.shared.fetchContacts()
        presenter?.view.parentContactList?.reloadData()
        
    }
    
    /// - устанавливаем количество строк в таблице первого экрана
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter?.persons.count ?? 0
    }
    /// - конфигурирование ячейчки
    /// - заполнение ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = presenter?.persons[indexPath.row]
        cell.textLabel?.text = person?.fullName
        return cell
    }
    /// - переход на экран с детальной информацией DetailContact по тапу на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailContactView(parentDVC: UIView())
        let presenterDVC = DetailContactPresenter(viewDVC: view)
        let detailVC = DetailContactViewController(presenterDVC: presenterDVC)
        guard let person = presenter?.personIndex(at: indexPath.row) else { return }
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    /// - свайп вправа и удаление ячейки 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.persons.remove(at: indexPath.row)
            StorageManager.shared.deleteContacts(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
