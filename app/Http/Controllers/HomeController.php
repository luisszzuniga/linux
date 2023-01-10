<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index (Request $request)
    {
        $users = User::all();
        
        return view('welcome')->with('users', $users);
    }
}
