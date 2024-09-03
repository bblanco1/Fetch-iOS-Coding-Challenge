//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import SwiftUI

@MainActor
class RecipesViewModel: ObservableObject {
    @Published var results: [Recipe] = [Recipe]()
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private let recipeService: APIServiceProtocol


    init(recipeService: APIServiceProtocol = APIService()) {
        self.recipeService = recipeService
        self.fetchRecipes()
    }

    private func fetchRecipes() {
        isLoading = true
        Task {
            do {
                self.results = try await recipeService.fetchRecipes()
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
}
