//
//  Recipe.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import Foundation

struct RecipeResults: Decodable {
    let meals: [Recipe]
}

struct Recipe: RecipeProtocol {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
