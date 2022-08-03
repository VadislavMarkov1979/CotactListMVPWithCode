//
//  Colors.swift
//  CotactListMVPWithCode
//
//  Created by Владимир on 07.06.2022.
//

import UIKit
/// - константы цвета для экранов приложения
enum Colors {
    /// Цвет фона найвигейшн бар
    case bacgroundBar
    /// Цвет элементов навигейшн бара
    case bacgroundElement
    /// Цеет текста кнопки навигейшн бара
    case textButton
    /// Цвет основного текста вью
    case textPrimary
    /// Цвет второстипенного текста вью
    case textSecondary
    
}

extension Colors {
    var value: UIColor {
        get {
            switch self {
            case.bacgroundBar:
                return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            case.bacgroundElement:
                return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            case.textButton:
                return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            case.textPrimary:
                return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case.textSecondary:
                return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
        }
    }
}
