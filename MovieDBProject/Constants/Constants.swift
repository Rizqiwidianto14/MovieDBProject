//
//  Constants.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

public class Constant{
    public static var baseUrl: String{
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
    
    public static var imageBaseUrl: String{
        return Bundle.main.infoDictionary?["IMAGE_BASE_URL"] as? String ?? ""
    }
    
    public static var apiKey: String{
        return Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    }

}
