package com.glenbyrne.ead_ca2.ui.movies.detail

import androidx.lifecycle.ViewModel
import com.glenbyrne.ead_ca2.data.repository.MovieRepository
import com.glenbyrne.ead_ca2.internal.lazyDeferred

class MovieMoreDetailsViewModel(
    private val movieId: Int,
    private val movieRepository: MovieRepository
) : ViewModel() {
    val movie by lazyDeferred {
        movieRepository.getMovieDetails(movieId)
    }
}
