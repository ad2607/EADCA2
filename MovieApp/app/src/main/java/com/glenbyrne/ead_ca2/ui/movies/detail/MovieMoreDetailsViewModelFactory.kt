package com.glenbyrne.ead_ca2.ui.movies.detail

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.glenbyrne.ead_ca2.data.repository.MovieRepository

class MovieMoreDetailsViewModelFactory(
    private val movieId: Int,
    private val movieRepository: MovieRepository
) : ViewModelProvider.NewInstanceFactory() {
    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return MovieMoreDetailsViewModel(movieId, movieRepository) as T
    }
}