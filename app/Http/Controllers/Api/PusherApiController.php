<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

class PusherApiController extends Controller
{
    /**
     * Get the pusher config
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function getPusherConfig()
    {
        $pusher = config('broadcasting.connections.pusher');

        return response()->success([
            'broadcaster' => 'pusher',
            'key' => $pusher['key'],
            'cluster' => $pusher['options']['cluster'],
            'wsHost' => $pusher['options']['wsHost'],
            'wsPort' => $pusher['options']['port'],
            'wssPort' => $pusher['options']['port'],
            'forceTLS' => $pusher['options']['useTLS'],
            'enabledTransports' => ['ws', 'wss'],
            'authEndpoint' => url('/broadcasting/auth'),
        ]);
    }
}
