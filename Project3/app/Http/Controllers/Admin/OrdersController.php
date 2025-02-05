<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

class OrdersController extends Controller
{
    public function Orders(){

        $orders = Order::all();
        return view('Admin.orders.orders' , compact('orders'));
    }

    
    public function status($id){

        $order = Order::find($id);
       

        if($order->order_status ==1 ){
            $order->update([
                'order_status' => 2,
            ]);
            $order->save();
        }

        elseif($order->order_status ==2 ){
            $order->update([
                'order_status' => 3,
            ]);
            $order->save();
        }


        elseif($order->order_status ==3 ){
            $order->update([
                'order_status' => 4,
            ]);
            $order->save();
        }

        else{
            return back();
        }

        Alert::success('موفقیت', ' وضعیت با موفقیت  تغییر کرد');

        return redirect()->route('Admin.orders');
    }


    public function detalis($id){
        $order = Order::find($id);
       
        return view('Admin.orders.order-details' , compact('order' ));
    }


}
