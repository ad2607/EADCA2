package com.glenbyrne.ead_ca2.data.network

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.network.response.MoviesResponse

interface MovieNetworkDataSource {
    val downloadedMovies: LiveData<MoviesResponse>

    suspend fun fetchAllMovies()
}