//  RecipeDetailView.swift
//  RecetarioAPP
//
//  Created by Felipe Navarrete Navarrete on 25-09-25.

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @Binding var favorites: [String: Bool]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Nombre de la receta
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Sección de Ingredientes
                Text("Ingredientes")
                    .font(.title2)
                    .fontWeight(.semibold)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                
                // Sección de Instrucciones
                Text("Instrucciones")
                    .font(.title2)
                    .fontWeight(.semibold)
                ForEach(recipe.instructions, id: \.self) { instruction in
                    Text(instruction)
                }

                Button {
                    // Alterna el valor en el diccionario de favoritos
                    favorites[recipe.id, default: false].toggle()
                } label: {
                    Label("Marcar como Favorito", systemImage: favorites[recipe.id] == true ? "heart.fill" : "heart")
                }
                .font(.headline)
                .padding()
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
