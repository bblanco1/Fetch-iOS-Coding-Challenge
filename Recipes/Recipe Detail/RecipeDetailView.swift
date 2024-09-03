//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject var viewModel: RecipeDetailViewModel

    init(recipeId: String) {
        self._viewModel = .init(wrappedValue: RecipeDetailViewModel(recipeId: recipeId))
    }

    var body: some View {
        VStack {
            if viewModel.error != nil {
                Text("Failed to get recipe details")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.largeTitle)
                    .padding()
                    .multilineTextAlignment(.center)
            }

            if let recipeDetail = viewModel.recipeDetail {
                ScrollView {
                    Text(recipeDetail.strMeal)
                         .font(.system(.title, weight: .medium))
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .padding([.leading, .bottom])

                   Text("Ingredients")
                        .font(.system(.title2, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()

                    ForEach(recipeDetail.ingredientMeasurePairs, id: \.0) { ingredient, measurement in
                        HStack {
                            Text("\(ingredient.capitalized)")
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("\(measurement)")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding([.leading, .bottom])
                    }

                    Text("Recipe Prep")
                         .font(.system(.title2, weight: .medium))
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .padding()

                    Text(recipeDetail.strInstructions ?? "No Instructions Available").padding([.leading, .trailing])
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetailView(recipeId: "52768")
}
