<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
public function users(){

    $users = User::all();
    return view('Admin.users.users' , compact('users'));

}


public function index(){

    $orders = Order::all();

    $price = 0;

    $all_orders = 0;

    foreach($orders as $order){

        if($order->order_status == 4){
            $price += $order->price;
        }
    }

    $products = Product::all();

    $users = User::all();

    foreach($orders as $order){

        if($order->order_status !== 0 && $order->order_status !== 5){
            $all_orders += 1;
        }
    }

    return view('Admin.index' , compact('price' , 'products' , 'users' , 'all_orders'));
}

}
