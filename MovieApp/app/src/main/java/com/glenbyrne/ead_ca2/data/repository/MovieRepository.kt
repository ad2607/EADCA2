package com.glenbyrne.ead_ca2.data.repository

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.db.movieToDbMap.detail.MovieDetailEntryInterface
import com.glenbyrne.ead_ca2.data.db.movieToDbMap.list.MovieSimpleEntryInterface

interface MovieRepository {
    suspend fun getAllMovies() : LiveData<out List<MovieSimpleEntryInterface>>
    suspend fun getMovieDetails(id: Int) : LiveData<out MovieDetailEntryInterface>
}