package com.glenbyrne.ead_ca2.data.network

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.network.response.AllMoviesResponse

interface MovieNetworkDataSource {
    val downloadedMovies: LiveData<AllMoviesResponse>

    suspend fun fetchAllMovies()
}