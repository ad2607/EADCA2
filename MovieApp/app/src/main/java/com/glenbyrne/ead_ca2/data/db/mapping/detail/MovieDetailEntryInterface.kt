package com.glenbyrne.ead_ca2.data.db.mapping.detail

interface MovieDetailEntryInterface {
    val description: String
    val director: String
    val id: Int
    val length: String
    val imdbRating: Double
    val releaseDate: String
    val rottenTomatoesScore: Int
    val title: String
}