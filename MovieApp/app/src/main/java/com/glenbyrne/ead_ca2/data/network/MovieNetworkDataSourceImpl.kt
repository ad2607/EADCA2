package com.glenbyrne.ead_ca2.data.network

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.glenbyrne.ead_ca2.data.network.response.AllMoviesResponse
import com.glenbyrne.ead_ca2.internal.NoConnectivityException

class MovieNetworkDataSourceImpl(private val movieApiService: MovieApiService) : MovieNetworkDataSource {
    private val _downloadedMovies = MutableLiveData<AllMoviesResponse>()
    override val downloadedMovies: LiveData<AllMoviesResponse>
        get() = _downloadedMovies

    override suspend fun fetchAllMovies() {
        try {
            val fetchAllMovies = movieApiService.getAllMovies().await()
            _downloadedMovies.postValue(fetchAllMovies)
        } catch (e: NoConnectivityException) {
            Log.e("Connectivity","No Internet Connection.", e)
        }
    }
}