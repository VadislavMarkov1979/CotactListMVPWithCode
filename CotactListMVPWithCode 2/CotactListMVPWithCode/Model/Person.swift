//
//  Person.swift
//  CotactListMVPWithCode
//  Created by Владимир on 31.05.2022.
//

/// - модель данных
struct Person: Codable {
    let name: String
    var surname: String
    let phone: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
///// - инициализатор для name & phone
//    init(name: String, phone: String) {
//        self.name = name
//        self.phone = phone
//    }
/// - инициализатор для name & phone & surname
    init(name: String, surname: String, phone: String) {
        self.name = name
        self.surname = surname
        self.phone = phone
    }
}
/// - сравниваем уже внесенных значений в массив с новыми. Если значения равны - новые не добавляются
extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.phone == rhs.phone && lhs.name == rhs.name
    }
}
