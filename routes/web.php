<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Auth::routes();

Route::get('/home', 'HomeController@index');
Route::post('/delete', 'HomeController@deleteFile');
Route::post('/upload', 'HomeController@upload');

Route::post('/delete', 'HomeController@deleteFile');
Route::post('/addFolder', 'HomeController@addFolder');
Route::post('/uploads/{folder}/folder', 'HomeController@getFileInFolder');
