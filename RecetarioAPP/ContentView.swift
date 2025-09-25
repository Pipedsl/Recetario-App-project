//
//  ContentView.swift
//  RecetarioAPP
//
//  Created by Felipe Navarrete Navarrete on 25-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @State var recipes: [Recipe] = []
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach($recipes) { $recipe in
                        NavigationLink{
                            RecipeDetailView(recipe: $recipe)
                        } label: {
                            Text(recipe.name)
                            if recipe.isFavorite {
                                Image(systemName: "heart.fill")
                                    
                            }
                        }
                        
                    }
                }
                .navigationTitle("Recetas Argentinas")
                .onAppear {
                    // Llama a la función de carga cuando la vista aparece
                    loadRecipes()
                }
            }
            .padding()
        }
        
    }
    
    private func loadRecipes(){
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            print( "Error: recipes.json no se encuentra.")
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            let decodedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = decodedRecipes
        } catch {
            print( "Error al decodificar los datos: \(error)")
        }
        

    }
}

#Preview {
    ContentView()
}
