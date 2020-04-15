package com.glenbyrne.ead_ca2

import android.app.Application
import com.glenbyrne.ead_ca2.data.db.MovieDatabase
import com.glenbyrne.ead_ca2.data.network.*
import com.glenbyrne.ead_ca2.data.repository.MovieRepository
import com.glenbyrne.ead_ca2.data.repository.MovieRepositoryImpl
import com.glenbyrne.ead_ca2.ui.movies.detail.MovieMoreDetailsViewModelFactory
import com.glenbyrne.ead_ca2.ui.movies.list.MovieListViewModelFactory
import org.kodein.di.Kodein
import org.kodein.di.KodeinAware
import org.kodein.di.android.x.androidXModule
import org.kodein.di.generic.*

class MovieApplication : Application(), KodeinAware {
    override val kodein = Kodein.lazy {
        import(androidXModule(this@MovieApplication))

        bind() from singleton { MovieDatabase(instance()) }
        bind() from singleton { instance<MovieDatabase>().moviesDao() }
        bind<ConnectivityInterceptor>() with singleton { ConnectivityInterceptorImpl(instance()) }
        bind() from singleton { MovieApiService(instance()) }
        bind<MovieNetworkDataSource>() with singleton { MovieNetworkDataSourceImpl(instance()) }
        bind<MovieRepository>() with singleton { MovieRepositoryImpl(instance(), instance()) }
        bind() from provider { MovieListViewModelFactory(instance()) }
        bind() from factory() { movieId: Int ->
            MovieMoreDetailsViewModelFactory(
                movieId,
                instance()
            )
        }
    }
}