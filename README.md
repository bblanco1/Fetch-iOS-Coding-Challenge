# Fetch iOS Coding Challenge

## Recipes App

This project is a SwiftUI-based iOS application that fetches and displays recipes using `TheMealDB` API. The app showcases a list of dessert recipes, and users can view detailed information about each recipe, including ingredients and instructions.

## Features

- **Recipe List**: Displays a list of dessert recipes fetched from `TheMealDB` API.
- **Recipe Details**: Shows detailed information about a selected recipe, including ingredients, measurements, and preparation instructions.
- **Asynchronous Data Fetching**: Uses Swift's `async/await` for asynchronous data fetching.
- **Error Handling**: Handles errors gracefully and provides feedback to the user.
- **Adaptive UI**: Utilizes SwiftUI’s adaptive layout features to support different screen sizes.

## Project Structure

### API

- **`APIService.swift`**: Handles all the networking operations to fetch recipes and recipe details from `TheMealDB` API.
  - **`APIServiceProtocol`**: A protocol defining the required methods for fetching recipes and recipe details. This enables dependency injection and easier testing.
  - **`APIService`**: Implements `APIServiceProtocol`, providing methods to fetch recipe data and decode JSON responses.
  - **Error Handling**: `APIError` enum handles various error cases such as bad responses, missing recipe details, and invalid URLs.

### Models

- **`RecipeProtocol`**: A protocol that defines the required properties for a recipe.
- **`Recipe.swift`**: Defines the data models for recipes.
  - **`Recipe`**: Implements `RecipeProtocol`, representing a recipe with a name, thumbnail, and ID.
  - **`RecipeResults`**: Represents the JSON structure returned by the API for a list of recipes.
- **`RecipeDetail.swift`**: Extends the recipe model to include detailed information, such as instructions and ingredient-measurement pairs.

### ViewModels

- **`RecipesViewModel.swift`**: The view model for the `RecipesView`, responsible for fetching and managing the list of recipes.
- **`RecipeDetailViewModel.swift`**: The view model for the `RecipeDetailView`, responsible for fetching and managing the detailed recipe data.

### Views

- **`RecipesView.swift`**: Displays a grid of recipe cards. Each card is clickable and navigates to the `RecipeDetailView`.
  - **`RecipeCellView.swift`**: Represents a single recipe cell in the grid, displaying the recipe name and thumbnail image.
- **`RecipeDetailView.swift`**: Displays detailed information about a selected recipe, including ingredients and instructions.

## Dependencies

- **SwiftUI**: For building the UI.
- **URLSession**: For networking tasks.

## Installation

1. **Clone the repository**:
   ```
   git clone https://github.com/yourusername/RecipesApp.git
   cd RecipesApp
   ```
2. **Open the project**:
  ```
   open RecipesApp.xcodeproj
   ```
3. **Run the app**:
	* Select the target device or simulator.
	* Press Cmd + R to build and run the project.

## Usage

- On the home screen, you’ll see a grid of dessert recipes.
- Tap on any recipe to view its details, including the ingredients and instructions.

## API Reference

- The app fetches data from [TheMealDB API](https://www.themealdb.com/api.php).
- **Recipe List Endpoint**: `https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert`
- **Recipe Details Endpoint**: `https://www.themealdb.com/api/json/v1/1/lookup.php?i=<recipeId>`

## Customization

- **Modify the category**:
  - You can change the recipe category by altering the API endpoint in `APIService.swift`.
- **Change the UI theme**:
  - Customize the color scheme or UI components in the SwiftUI views as needed.