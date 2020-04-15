package com.glenbyrne.ead_ca2.data.db.movieToDbMap.detail

import androidx.room.ColumnInfo
import com.glenbyrne.ead_ca2.data.db.movieToDbMap.detail.MovieDetailEntryInterface

data class MovieDetailEntry(
//    @ColumnInfo(name = "actors")
//    override val actors: List<Actor>,
    @ColumnInfo(name = "description")
    override val description: String,
    @ColumnInfo(name = "director")
    override val director: String,
    @ColumnInfo(name = "id")
    override val id: Int,
    @ColumnInfo(name = "length")
    override val length: String,
    @ColumnInfo(name = "imdbRating")
    override val imdbRating: Double,
    @ColumnInfo(name = "releaseDate")
    override val releaseDate: String,
    @ColumnInfo(name = "title")
    override val title: String
) : MovieDetailEntryInterface