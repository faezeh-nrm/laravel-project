<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function registerForm(){
        return view("Auth.register");

    }

    public function register(Request $request){

             //Validate
             $request->validate([
                'name' => 'required',
                'email' => 'required',
                'password' => 'required'
            ]);

            $emailUser = User::where('email' , $request->email)->first();

            if($emailUser == Null){
                
                $inputs = $request->all();
                $user = User::create($inputs);
                Auth::login($user);
                return redirect()->route('home');

            }
            else{

                return redirect()->route('registerForm')->with('error' , 'این اطلاعات از قبل وجود دارد');

            }

    }


    public function loginForm(){
        return view("Auth.login");

    }

    public function login(Request $request){


           //Validate
           $request->validate([
            'email' => 'required',
            'password' => 'required'
        ]);
        $user = User::where('email' , $request->email)->where('password' , $request->password)->first();
        if($user){

            Auth::login($user);
            return redirect()->route("home");
            

        }
        else{
            return redirect()->route('loginForm')->with('error' ,'اطلاعات وارد شده صحیح نمی باشد');
        }
        

    }


    public function logout(){
        Auth::logout();
        return back();
    }
}
