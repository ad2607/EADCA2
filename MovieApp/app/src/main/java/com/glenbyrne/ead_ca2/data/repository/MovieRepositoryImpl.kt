package com.glenbyrne.ead_ca2.data.repository

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.db.MoviesDao
import com.glenbyrne.ead_ca2.data.db.mapping.detail.MovieDetailEntryInterface
import com.glenbyrne.ead_ca2.data.db.mapping.list.MovieSimpleEntryInterface
import com.glenbyrne.ead_ca2.data.network.MovieNetworkDataSource
import com.glenbyrne.ead_ca2.data.network.response.MoviesResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MovieRepositoryImpl(
    private val moviesDao: MoviesDao,
    private val movieNetworkDataSource: MovieNetworkDataSource
) : MovieRepository {

    init {
        movieNetworkDataSource.downloadedMovies.observeForever { newAllMovies ->
            persistFetchedAllMovies(
                newAllMovies
            )
        }
    }

    override suspend fun getAllMovies(): LiveData<out List<MovieSimpleEntryInterface>> {

        return withContext(Dispatchers.IO) {
            initMovieData()
            return@withContext moviesDao.getAllMovies()
        }
    }

    override suspend fun getMovieDetails(id: Int): LiveData<out MovieDetailEntryInterface> {

        return withContext(Dispatchers.IO) {
            initMovieData()
            return@withContext moviesDao.getMovieDetails(id)
        }
    }

    private fun persistFetchedAllMovies(fetchedMovies: MoviesResponse) {
        GlobalScope.launch(Dispatchers.IO) {
            moviesDao.insert(fetchedMovies)
        }
    }

    private suspend fun initMovieData() {
        fetchAllMovies()
    }

    private suspend fun fetchAllMovies() {
        movieNetworkDataSource.fetchAllMovies()
    }
}