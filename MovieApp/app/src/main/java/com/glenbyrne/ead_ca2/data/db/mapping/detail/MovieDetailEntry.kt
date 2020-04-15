package com.glenbyrne.ead_ca2.data.db.mapping.detail

import androidx.room.ColumnInfo

data class MovieDetailEntry(
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
    @ColumnInfo(name = "rottenTomatoesScore")
    override val rottenTomatoesScore: Int,
    @ColumnInfo(name = "title")
    override val title: String
) : MovieDetailEntryInterface