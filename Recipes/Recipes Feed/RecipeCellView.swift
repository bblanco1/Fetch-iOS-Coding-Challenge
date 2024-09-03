//
//  RecipeCellView.swift
//  Recipes
//
//  Created by Brian Blanco on 9/3/24.
//

import SwiftUI

struct RecipeCellView: View {
    let meal: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "birthday.cake")
                    .resizable()
                    .scaledToFit()
            }

            HStack(alignment: .top) {
                Text(meal.strMeal)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 6)
            Spacer()
        }
        .background(Color.customOrange)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    RecipeCellView(
        meal:
            Recipe(
                strMeal: "Apam balik",
                strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                idMeal: "53049")
    )
    .frame(width: 220, height: 220)
}
