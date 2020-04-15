package com.glenbyrne.ead_ca2.data.network

import com.glenbyrne.ead_ca2.data.network.response.AllMoviesResponse
import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import kotlinx.coroutines.Deferred
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

// https://movieapi20200406063228.azurewebsites.net/api/Movies/all

interface MovieApiService {

    @GET("all")
    fun getAllMovies(): Deferred<AllMoviesResponse>

    companion object {
        operator fun invoke(
            connectivityInterceptor: ConnectivityInterceptor
        ): MovieApiService {
            val requestInterceptor = Interceptor { chain ->

                val url = chain.request().url().newBuilder().build()
                val request = chain.request().newBuilder().url(url).build()

                return@Interceptor chain.proceed(request)
            }
            val okHttpClient = OkHttpClient.Builder().addInterceptor(requestInterceptor).addInterceptor(connectivityInterceptor).build()

            return Retrofit.Builder().client(okHttpClient)
                .baseUrl("https://movieapi20200406063228.azurewebsites.net/api/Movies/")
                .addCallAdapterFactory(CoroutineCallAdapterFactory())
                .addConverterFactory(GsonConverterFactory.create()).build()
                .create(MovieApiService::class.java)
        }
    }
}