package com.glenbyrne.ead_ca2.ui.movies.list

import com.glenbyrne.ead_ca2.R
import com.glenbyrne.ead_ca2.data.db.mapping.list.MovieSimpleEntryInterface
import com.glenbyrne.ead_ca2.internal.glide.GlideApp
import com.xwray.groupie.kotlinandroidextensions.Item
import com.xwray.groupie.kotlinandroidextensions.ViewHolder
import kotlinx.android.synthetic.main.item_movie_list.*

class MovieListItem(
    val movieSimpleEntry: MovieSimpleEntryInterface
) : Item() {
    override fun bind(viewHolder: ViewHolder, position: Int) {
        viewHolder.apply {
            movieListItem_title.text = movieSimpleEntry.title
            updateMoviePoster()
        }
    }

    override fun getLayout() = R.layout.item_movie_list

    private fun ViewHolder.updateMoviePoster() {
        GlideApp.with(this.containerView)
            .load("https://movieapi20200406063228.azurewebsites.net/api/Movies/poster?id=" + movieSimpleEntry.id)
            .into(movieListItem_poster)
    }
}