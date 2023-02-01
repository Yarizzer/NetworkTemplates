//
//  BasicRequestModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//

struct BasicRequestModel: Encodable, Decodable {
    init(id: Int, userId: Int, title: String, body: String) {
        self.id =        id
        self.userId =   userId
        self.title =    title
        self.body =     body
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id =       try container.decode(Int.self, forKey: .id)
        self.userId =   try container.decode(Int.self, forKey: .userId)
        self.title =    try container.decode(String.self, forKey: .title)
        self.body =     try container.decode(String.self, forKey: .body)
    }
    
    func prepareForJSON() -> [String : Any] {
        return ["id"        : self.id,
                "userId"    : self.userId,
                "title"     : self.title,
                "body"      : self.body]
    }
    
    var id: Int
    var userId: Int
    var title: String
    var body: String
}

extension BasicRequestModel {
    private enum CodingKeys: CodingKey {
        case id, userId, title, body
        
        var key: String {
            switch self {
            case .id:       return "id"
            case .userId:   return "avatarURL"
            case .title:    return "title"
            case .body: return "body"
            }
        }
    }
}
