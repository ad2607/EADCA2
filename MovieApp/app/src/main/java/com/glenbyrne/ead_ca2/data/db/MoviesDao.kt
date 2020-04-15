package com.glenbyrne.ead_ca2.data.db

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.glenbyrne.ead_ca2.data.db.entity.Movie
import com.glenbyrne.ead_ca2.data.db.mapping.detail.MovieDetailEntry
import com.glenbyrne.ead_ca2.data.db.mapping.list.MovieSimpleEntry

@Dao
interface MoviesDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insert(movieEntry: List<Movie>)

    @Query("select * from movie")
    fun getAllMovies(): LiveData<List<MovieSimpleEntry>>

    @Query("select * from movie where id = :movieId")
    fun getMovieDetails(movieId: Int): LiveData<MovieDetailEntry>
}