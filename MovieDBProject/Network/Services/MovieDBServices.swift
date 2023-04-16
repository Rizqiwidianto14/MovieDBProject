//
//  MovieDBServices.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Moya

enum MovieDBServices {
    case genres
    case movieListByGenres(page:Int, genreId: Int)
}

extension MovieDBServices: TargetType {
    var baseURL: URL {
        guard let baseurl = URL(string: Constant.baseUrl) else { fatalError("baseURL could not be configured.")}
        return baseurl
    }
    
    var path: String {
        switch self {
        case .genres:
            return "genre/movie/list"
        case .movieListByGenres:
            return "discover/movie"
        }
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var task: Moya.Task {
        switch self {
        case .genres:
            return .requestParameters(parameters: ["api_key": Constant.apiKey], encoding: URLEncoding.queryString)
        case .movieListByGenres(page: let page, genreId: let genreId):
            return .requestParameters(parameters: ["page":page, "api_key":  Constant.apiKey, "with_genres": genreId],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data{
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
