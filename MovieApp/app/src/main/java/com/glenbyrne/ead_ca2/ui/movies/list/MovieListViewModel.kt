package com.glenbyrne.ead_ca2.ui.movies.list

import androidx.lifecycle.ViewModel
import com.glenbyrne.ead_ca2.data.repository.MovieRepository
import com.glenbyrne.ead_ca2.internal.lazyDeferred

class MovieListViewModel (
    private val movieRepository: MovieRepository
) : ViewModel() {
    val movies by lazyDeferred {
        movieRepository.getAllMovies()
    }
}
