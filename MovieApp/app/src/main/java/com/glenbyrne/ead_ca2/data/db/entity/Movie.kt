package com.glenbyrne.ead_ca2.data.db.entity

import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(tableName = "movie", indices = [Index(value = ["id"], unique = true)])
data class Movie(
    val description: String,
    val director: String,
    @PrimaryKey(autoGenerate = false)
    val id: Int,
    val imdbRating: Double,
    val length: String,
    val releaseDate: String,
    val rottenTomatoesScore: Int,
    val title: String
)