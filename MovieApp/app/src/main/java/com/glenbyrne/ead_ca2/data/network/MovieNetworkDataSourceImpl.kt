package com.glenbyrne.ead_ca2.data.network

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.glenbyrne.ead_ca2.data.network.response.MoviesResponse
import com.glenbyrne.ead_ca2.internal.NoConnectivityException

class MovieNetworkDataSourceImpl(private val movieApiService: MovieApiService) : MovieNetworkDataSource {
    private val _downloadedMovies = MutableLiveData<MoviesResponse>()
    override val downloadedMovies: LiveData<MoviesResponse>
        get() = _downloadedMovies

    override suspend fun fetchAllMovies() {
        try {
            val fetchAllMovies = movieApiService.getMoviesAsync().await()
            _downloadedMovies.postValue(fetchAllMovies)
        } catch (e: NoConnectivityException) {
            Log.e("Connectivity","No Internet Connection.", e)
        }
    }
}