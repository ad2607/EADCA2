package com.glenbyrne.ead_ca2.data.repository

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.db.mapping.detail.MovieDetailEntryInterface
import com.glenbyrne.ead_ca2.data.db.mapping.list.MovieSimpleEntryInterface

interface MovieRepository {
    suspend fun getAllMovies() : LiveData<out List<MovieSimpleEntryInterface>>
    suspend fun getMovieDetails(id: Int) : LiveData<out MovieDetailEntryInterface>
}