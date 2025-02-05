<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Baner;
use App\Models\CartItem;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderItems;
use App\Models\Product;
use App\Models\Slider;
use App\Models\TextBaner;
use Evryn\LaravelToman\CallbackRequest;
use Evryn\LaravelToman\FakeRequest;
use Illuminate\Http\Request;
use Artesaos\SEOTools\Facades\SEOMeta;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;
use Evryn\LaravelToman\Facades\Toman;
use Evryn\LaravelToman\Money;

class UserController extends Controller
{
    public function home(){


      $first_categories = Category::all()->first()->take(8)->get();
      $last_products = Product::all()->last()->take(8)->get();

      $best_category = Category::where('status' , 1)->first();
      $best_products = Product::where('cat_id' , $best_category->id)->first()->take(6)->get();

       $products = Product::where('status', 1 )->first()->take(4)->get();

       $rand_products = Product::all()->random(3);

       $categories = Category::all();

       $sliders = Slider::all();

       $baner = Baner::all()->last();

       $textbaner = TextBaner::all()->last();

        return view("User/home" , compact('first_categories' , 'last_products' , 'best_products' ,'products' , 'rand_products' ,'categories', 'sliders' , 'baner','textbaner'));
    }



    public function product($id){

        $product = Product::find($id);

        SEOMeta::setTitle($product->title);
        SEOMeta::setDescription($product->description);

        return view("User/singleproduct" , compact('product'));

    }

    public function category($id){


        $category = Category::find($id);
        SEOMeta::setTitle($category->name);
        return view("User/singlecategory" , compact('category'));
    }

    public function addtocart($id , Request $request){


        if(Auth::check()){
        $product = Product::find($id);
        if($request->number <= $product->inventory){
            $inputs = $request->all();
        $inputs['user_id'] = Auth()->user()->id;
        $inputs['product_id'] = $id ;
        CartItem::create($inputs);
        Alert::success('موفقیت', 'محصول با موفقیت به سبد خرید اضافه شد');
        // return back();
        return redirect()->route("home");

        }

        else {
        
            Alert::error('خطا', 'تعداد موجودی کالا کافی نمیباشد');
            // return back();
            return back();
    
        }
        
        }
        else {
        
            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        }
    } 


    public function CartItems(){


        if(Auth::check()){

            // $cartItems = Auth::user()->carts;
            $cartItems = CartItem::where('user_id' , Auth()->user()->id )->get();
            return view('User.cart-item',compact('cartItems'));

        }

        else{
            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        }
    }

    public function DeleteCart($id){
        

        if(Auth::check()){

            $cart = CartItem::Where('user_id' , Auth::user()->id)->where('product_id' , $id)->first();
            if($cart){

                
                $cart->delete();
                return back();

            }

            
            return back();
            

            
           

        }
        else{
            
            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        }



    }

    public function information(){

        
        if(Auth::check()){

           return view('User.information');

            }
        
        else{
            
            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        }



    }

    public function order(Request $request){
        if(Auth::check()){


            $inputs = $request->all();
            $inputs['user_id'] = Auth::user()->id ;


            $Finalprice = 0;

            $cartItems = Auth()->user()->carts;

            foreach ($cartItems as $cartItem) {
             $Finalprice += ($cartItem->product->price * $cartItem->number);
            }

            $inputs['price'] = $Finalprice ;
            $inputs['order_status'] = 0 ;  //به معنای ثبت شدن سفارش

            $order = Order::create($inputs);
            

            // $orderItems 
            foreach ($cartItems as $cartItem) {

                $orderItem['user_id'] = Auth::user()->id ; 
                $orderItem['product_id'] = $cartItem->product_id ; 

                if($cartItem->color !== Null){
                    $orderItem['color'] = $cartItem->color ; 
                }

                if($cartItem->size !== Null){
                    $orderItem['size'] = $cartItem->size ; 
                }

                $orderItem['number'] = $cartItem->number ; 
                $orderItem['order_id'] = $order->id ; 
                OrderItems::create($orderItem);
                $cartItem->delete();

                //کم کردن تعداد موجودی محصول
                $product = Product::find($cartItem->product_id);
                $New_inventory = $product->inventory - $cartItem->number ;
                $product->update([

                    'inventory' => $New_inventory ,
                ]);
                $product->save();


                
                
               }




    //            $request = Toman::orderId($order->id)
    // ->amount($order->price)
    // ->description('پرداخت انلاین')
    // ->callback(route('callback'))
    // ->mobile($order->mobile)
    // ->request();
                 
    $request = Toman::amount($order->price)
    ->description('پرداخت برای انلاین شاپ نایت بلاد')
    ->callback(route('callback'))
    ->mobile($order->mobile)
    ->request();
   
    

   

    // // dd($request);

    // $fakeRequest = new FakeRequest([
    //     'amount' => $order->price,
    //     'description' => 'پرداخت برای انلاین شاپ نایت بلاد',
    //     'callback' => route('callback'),
    //     'mobile' => $order->mobile,
    // ]);

    // $request->fakeRequest = $fakeRequest;
    // $reponse = $request->request();



    if ($request->successful()) {


        

        return $request->pay(); 
        
    }


        }
        else{

            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        }



    }




    public function callback(CallbackRequest $request)
    {

        
         $order = Order::where('user_id' , Auth::user()->id)->where('order_status' , 0)->orderBy('created_at', 'desc')->first();
        $payment = $request->amount($order->price)->verify();

        if ($payment->successful()) {
            $order->update([
                'order_status' => 1 ,
            ]);
            $order->save();
            Alert::success('موفقیت', 'سفارش شما با موفقیت ثبت شد');
            return redirect()->route('home');

        }
        
        if ($payment->alreadyVerified()) {
            // ...
        }
        
        if ($payment->failed()) {
            // ...
        }
    }



    
    public function myOrder(){

        if(Auth::check()){

           
        $lastorder = Order::where('user_id' , Auth::user()->id)->orderBy('created_at', 'desc')->first();

        return view('User.my-order' , compact('lastorder'));}
        else{

            return redirect()->route('loginForm')->with('error' , 'لطفا ابتدا وارد شوید');
        
        }

    }


public function search(Request $request)
{
    $products = Product::where('name' , 'like','%'.$request['search'].'%')->get();
    return view('User.products', compact('products'));

}
   


}

