package com.glenbyrne.ead_ca2.data.repository

import androidx.lifecycle.LiveData
import com.glenbyrne.ead_ca2.data.db.AllMoviesDao
import com.glenbyrne.ead_ca2.data.db.movieToDbMap.detail.MovieDetailEntryInterface
import com.glenbyrne.ead_ca2.data.db.movieToDbMap.list.MovieSimpleEntryInterface
import com.glenbyrne.ead_ca2.data.network.MovieNetworkDataSource
import com.glenbyrne.ead_ca2.data.network.response.AllMoviesResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MovieRepositoryImpl(
    private val allMoviesDao: AllMoviesDao,
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
            return@withContext allMoviesDao.getAllMovies()
        }
    }

    override suspend fun getMovieDetails(id: Int): LiveData<out MovieDetailEntryInterface> {

        return withContext(Dispatchers.IO) {
            initMovieData()
            return@withContext allMoviesDao.getMovieDetails(id)
        }
    }

    private fun persistFetchedAllMovies(fetchedMovies: AllMoviesResponse) {
        GlobalScope.launch(Dispatchers.IO) {
            allMoviesDao.insert(fetchedMovies)
        }
    }

    private suspend fun initMovieData() {
        fetchAllMovies()
    }

    private suspend fun fetchAllMovies() {
        movieNetworkDataSource.fetchAllMovies()
    }
}