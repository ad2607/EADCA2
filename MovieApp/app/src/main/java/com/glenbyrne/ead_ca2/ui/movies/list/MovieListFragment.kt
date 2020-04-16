package com.glenbyrne.ead_ca2.ui.movies.list

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.Navigation
import androidx.recyclerview.widget.GridLayoutManager
import com.glenbyrne.ead_ca2.R
import com.glenbyrne.ead_ca2.data.db.mapping.list.MovieSimpleEntryInterface
import com.glenbyrne.ead_ca2.ui.base.ScopedFragment
import com.xwray.groupie.GroupAdapter
import com.xwray.groupie.kotlinandroidextensions.ViewHolder
import kotlinx.android.synthetic.main.movie_list_fragment.*
import kotlinx.coroutines.launch
import org.kodein.di.KodeinAware
import org.kodein.di.android.x.closestKodein
import org.kodein.di.generic.instance

class MovieListFragment : ScopedFragment(), KodeinAware {
    override val kodein by closestKodein()
    private val viewModelFactory: MovieListViewModelFactory by instance<MovieListViewModelFactory>()

    private lateinit var viewModel: MovieListViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        setHasOptionsMenu(true)
        return inflater.inflate(R.layout.movie_list_fragment, container, false)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel =
            ViewModelProvider(this, viewModelFactory).get(MovieListViewModel::class.java)
        bindUI()
    }

    private fun bindUI() = launch {
        val movieList = viewModel.movies.await()
        movieList.observe(viewLifecycleOwner, Observer { movieList ->
            if (movieList == null) return@Observer

            group_loading.visibility = View.GONE

            initRecyclerView(movieList.toMovieList())
        })
    }

    private fun List<MovieSimpleEntryInterface>.toMovieList(): List<MovieListItem> {
        return this.map {
            MovieListItem(it)
        }
    }

    private fun initRecyclerView(items: List<MovieListItem>) {
        val groupAdapter = GroupAdapter<ViewHolder>().apply {
            addAll(items)
        }

        recyclerView.apply {
            layoutManager = GridLayoutManager(this@MovieListFragment.context, 3)
            adapter = groupAdapter
        }

        groupAdapter.setOnItemClickListener { item, view ->
            (item as? MovieListItem)?.let {
                showMovieDetails(it.movieSimpleEntry.id, view)
            }
        }
    }

    private fun showMovieDetails(id: Int, view: View) {
        val actionDetail = MovieListFragmentDirections.actionDetail(id)
        Navigation.findNavController(view).navigate(actionDetail)
    }
}
