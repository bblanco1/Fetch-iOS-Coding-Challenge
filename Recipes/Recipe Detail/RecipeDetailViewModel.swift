//
//  RecipeDetailViewModel.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import SwiftUI

@MainActor
class RecipeDetailViewModel: ObservableObject {
    @Published var recipeDetail: RecipeDetail?
    @Published var error: Error?

    private let recipeService: APIServiceProtocol
    private let recipeId: String

    init(recipeService: APIServiceProtocol = APIService(), recipeId: String) {
        self.recipeService = recipeService
        self.recipeId = recipeId
        fetchReceipeDetails()
    }

    private func fetchReceipeDetails() {
        Task {
            do {
                self.recipeDetail = try await recipeService.fetchRecipeDetails(for: recipeId)
            } catch {
                self.error = error
            }
        }
    }
}
