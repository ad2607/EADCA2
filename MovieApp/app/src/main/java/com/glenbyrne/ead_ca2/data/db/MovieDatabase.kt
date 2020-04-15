package com.glenbyrne.ead_ca2.data.db

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.glenbyrne.ead_ca2.data.db.entity.Movie

@Database(
    entities = [Movie::class],
    version = 2
)
abstract class MovieDatabase : RoomDatabase() {
    abstract fun moviesDao(): MoviesDao

    companion object {
        @Volatile
        private var instance: MovieDatabase? = null
        private val LOCK = Any()

        operator fun invoke(context: Context) = instance ?: synchronized(LOCK) {
            instance ?: buildDatabase(context).also { instance = it }
        }

        private fun buildDatabase(context: Context) =
            Room.databaseBuilder(context.applicationContext, MovieDatabase::class.java, "movies.db")
                .fallbackToDestructiveMigration()
                .build()
    }
}