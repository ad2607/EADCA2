package com.glenbyrne.ead_ca2.ui.movies.detail

import android.graphics.Color
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.glenbyrne.ead_ca2.R
import com.glenbyrne.ead_ca2.internal.IdNotFoundException
import com.glenbyrne.ead_ca2.internal.glide.GlideApp
import com.glenbyrne.ead_ca2.ui.base.ScopedFragment
import kotlinx.android.synthetic.main.movie_more_details_fragment.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import org.kodein.di.KodeinAware
import org.kodein.di.android.x.closestKodein
import org.kodein.di.generic.factory
import org.threeten.bp.LocalDate

class MovieMoreDetailsFragment : ScopedFragment(), KodeinAware {

    override val kodein by closestKodein()

    private val viewModelFactoryInstanceFactory: ((Int) -> MovieMoreDetailsViewModelFactory) by factory<Int, MovieMoreDetailsViewModelFactory>()

    private lateinit var viewModel: MovieMoreDetailsViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.movie_more_details_fragment, container, false)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        val safeArgs = arguments?.let { MovieMoreDetailsFragmentArgs.fromBundle(it) }
        val movieId = safeArgs?.movieIdInt ?: throw IdNotFoundException()

        viewModel = ViewModelProvider(this, viewModelFactoryInstanceFactory(movieId)).get(
            MovieMoreDetailsViewModel::class.java
        )

        bindUI()
    }

    private fun bindUI() = launch(Dispatchers.Main) {
        val movieDetails = viewModel.movie.await()

        movieDetails.observe(viewLifecycleOwner, Observer { movieEntry ->
            if (movieEntry == null) return@Observer
            updateTitle(movieEntry.title)
            updateDescriptionTitle()
            updateDescription(movieEntry.description)
            updateReleaseDateTitle()
            updateReleaseDate(movieEntry.releaseDate)
            updateLengthTitle()
            updateLength(movieEntry.length)
            updateDirectorTitle()
            updateDirector(movieEntry.director)
            updateIMDBRatingTitle()
            updateIMDBRating(movieEntry.imdbRating)
            updateRottenTomatoesScoreTitle()
            updateRottenTomatoesScore(movieEntry.rottenTomatoesScore)

            GlideApp.with(this@MovieMoreDetailsFragment)
                .load("https://movieapi20200406063228.azurewebsites.net/api/Movies/poster?id=" + movieEntry.id)
                .into(movieDetailsItem_poster)
        })
    }

    private fun updateTitle(title: String) {
        movieDetailsItem_title.text = title
    }

    private fun updateDescriptionTitle() {
        movieDetailsItem_descriptionTitle.text = "Synopsis"
    }

    private fun updateDescription(description: String) {
        movieDetailsItem_description.text = description
    }

    private fun updateReleaseDateTitle() {
        movieDetailsItem_releaseDateTitle.text = "Release Date"
    }

    private fun updateReleaseDate(releaseDate: String) {
        val formattedReleaseDate = LocalDate.parse(releaseDate)
        movieDetailsItem_releaseDate.text = formattedReleaseDate.year.toString()
    }

    private fun updateLengthTitle() {
        movieDetailsItem_lengthTitle.text = "Movie Length"
    }

    private fun updateLength(length: String) {
        movieDetailsItem_length.text = length
    }

    private fun updateDirectorTitle() {
        movieDetailsItem_directorTitle.text = "Directors"
    }

    private fun updateDirector(director: String) {
        movieDetailsItem_director.text = director
    }

    private fun updateIMDBRatingTitle() {
        movieDetailsItem_imdbRatingTitle.text = "IMDB"
    }

    private fun updateIMDBRating(imdbRating: Double) {
        movieDetailsItem_imdbRating.text = "$imdbRating"

        if(imdbRating >= 8) {
            movieDetailsItem_imdbRating.setTextColor(Color.GREEN)
        } else if (imdbRating < 8 && imdbRating >= 6) {
            movieDetailsItem_imdbRating.setTextColor(Color.YELLOW)
        } else if (imdbRating < 6 && imdbRating >= 4) {
            movieDetailsItem_imdbRating.setTextColor(Color.rgb(255,165,0))
        } else {
            movieDetailsItem_imdbRating.setTextColor(Color.RED)
        }
    }

    private fun updateRottenTomatoesScoreTitle() {
        movieDetailsItem_rottenTomatoesScoreTitle.text = "Rotten Tomatoes"
    }

    private fun updateRottenTomatoesScore(rottenTomatoesScore: Int) {
        movieDetailsItem_rottenTomatoesScore.text = "$rottenTomatoesScore%"

        when {
            rottenTomatoesScore >= 80 -> {
                movieDetailsItem_rottenTomatoesScore.setTextColor(Color.GREEN)
            }
            rottenTomatoesScore in 60..79 -> {
                movieDetailsItem_rottenTomatoesScore.setTextColor(Color.YELLOW)
            }
            rottenTomatoesScore in 40..59 -> {
                movieDetailsItem_rottenTomatoesScore.setTextColor(Color.MAGENTA)
            }
            else -> {
                movieDetailsItem_rottenTomatoesScore.setTextColor(Color.RED)
            }
        }
    }

}
