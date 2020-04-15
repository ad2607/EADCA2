package com.glenbyrne.ead_ca2.data.db.movieToDbMap.detail

interface MovieDetailEntryInterface {
//    val actors: List<Actor>
    val description: String
    val director: String
    val id: Int
    val length: String
    val imdbRating: Double
    val releaseDate: String
    val title: String
}