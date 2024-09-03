//
//  RecipeDetail.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import Foundation

struct RecipeDetailResults: Decodable {
    let meals: [RecipeDetail]
}

struct RecipeDetail: RecipeProtocol {
    let idMeal: String
    let strMeal: String
    let strInstructions: String?
    let strMealThumb: String?
    let strYoutube: String?
    let ingredientMeasurePairs: [(String, String)]

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions, strMealThumb, strYoutube
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strInstructions = try? container.decodeIfPresent(String.self, forKey: .strInstructions)
        self.strMealThumb = try? container.decodeIfPresent(String.self, forKey: .strMealThumb)
        self.strYoutube = try? container.decodeIfPresent(String.self, forKey: .strYoutube)

        let ingredients = (1...20).compactMap { index -> String? in
            guard let key = CodingKeys(stringValue: "strIngredient\(index)") else { return nil }
            if let ingredient = try? container.decodeIfPresent(String.self, forKey: key), !ingredient.isEmpty {
                return ingredient
            }
            return nil
        }

        let measures = (1...20).compactMap { index -> String? in
            guard let key = CodingKeys(stringValue: "strMeasure\(index)") else { return nil }
            if let measure = try? container.decodeIfPresent(String.self, forKey: key), !measure.isEmpty {
                return measure
            }
            return nil
        }

        self.ingredientMeasurePairs = zip(ingredients, measures)
            .filter { !$0.0.isEmpty && !$0.1.isEmpty }
    }
}
