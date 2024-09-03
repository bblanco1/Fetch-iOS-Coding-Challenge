//
//  RecipeProtocol.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import Foundation

protocol RecipeProtocol: Identifiable, Decodable {
    var idMeal: String { get }
    var strMeal: String { get }
}

extension RecipeProtocol {
    var id: String { idMeal }
}
