//
//  ContentView.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import SwiftUI

struct RecipesView: View {
    @StateObject var viewModel = RecipesViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16, content: {
                        ForEach(viewModel.results) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipeId: recipe.id), label: {
                                RecipeCellView(meal: recipe)
                            })
                            .foregroundStyle(Color(.label))
                        }
                    })
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Recipes")
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecipesView()
}
