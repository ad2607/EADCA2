package com.glenbyrne.ead_ca2.ui.movies.list

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.glenbyrne.ead_ca2.data.repository.MovieRepository

class MovieListViewModelFactory(
    private val movieRepository: MovieRepository
) : ViewModelProvider.NewInstanceFactory() {
    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return MovieListViewModel(movieRepository) as T
    }
}