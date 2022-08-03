//
//  Texts.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 07.06.2022.
//
import Foundation
/// - константы текстовые 
enum Texts: String {
    /// Текст навигейшн бар экрана контакт лист
    case titleContactBar = "Contact List"
    /// Тект экрана добавить контакт
    case titleNewAddBar = "Add New Contact"
    /// Текс экрана детали контакта
    case titleDetailBar = "Detail Contact"
    /// Текст плейс холдера текст филд Имя
    case placeholderTFName = "Enter your name"
    /// Текст плейс холдера текст филд Фамили
    case placeholderTFSurname = "Enter your surname"
    /// Текст плейс холдера текст филд Телевон
    case placeholderTFPhone = "Enter your phone"
    /// Текст кнопки Сохранить контакт
    case textButton = "Save contact"
    /// Текст кнопки алерт контроллера
    case alertOK = "Ok"
    /// Текст тайтл алерт контроллера
    case alertTitle = "ОШИБКА!"
    /// Текст алерт контроллера
    case alertMasseg = "Введите только цифры. Без символов, знаков и букв"
}
