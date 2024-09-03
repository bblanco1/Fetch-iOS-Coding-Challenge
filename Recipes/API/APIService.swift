//
//  APIService.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]
    func fetchRecipeDetails(for id: String) async throws -> RecipeDetail
}

struct APIService: APIServiceProtocol {

    enum APIError: Error {
        case recipeDetailNotFound
        case badResponse(statusCode: Int)
        case badURL
    }

    func fetchRecipes() async throws -> [Recipe] {
        let recipeResults: RecipeResults = try await self.decode(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")

        return recipeResults.meals
    }

    func fetchRecipeDetails(for id: String) async throws -> RecipeDetail {
        let recipeDetailResults: RecipeDetailResults = try await self.decode(urlString: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")

        if let recipeDetail = recipeDetailResults.meals.first {
            return recipeDetail
        }

        throw APIError.recipeDetailNotFound
    }

    private func decode<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        if let statusCode = (response as? HTTPURLResponse)?.statusCode, !(200..<299 ~= statusCode) {
            throw APIError.badResponse(statusCode: statusCode)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
