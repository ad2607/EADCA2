package com.glenbyrne.ead_ca2.data.db.mapping.list

import androidx.room.ColumnInfo

class MovieSimpleEntry (
    @ColumnInfo(name = "id")
    override val id: Int,
    @ColumnInfo(name = "title")
    override val title: String
) : MovieSimpleEntryInterface