package com.glenbyrne.ead_ca2.data.db.movieToDbMap.list

import androidx.room.ColumnInfo

class MovieSimpleEntry (
    @ColumnInfo(name = "id")
    override val id: Int,
    @ColumnInfo(name = "title")
    override val title: String,
    @ColumnInfo(name = "length")
    override val length: String,
    @ColumnInfo(name = "imdbRating")
    override val imdbRating: Double
) : MovieSimpleEntryInterface