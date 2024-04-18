<?php

use App\Http\Controllers\Api\PusherApiController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('/v1')->as('api.v1.')->group(function () {
    Route::get('/get-pusher-config', [PusherApiController::class, 'getPusherConfig'])->name('get-pusher-config');
});
