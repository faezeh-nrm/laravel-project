<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Baner;
use App\Models\Slider;
use App\Models\TextBaner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use RealRashid\SweetAlert\Facades\Alert;

class SliderBanerController extends Controller
{
    public function Sliders(){
        $sliders = Slider::all();
        return view("Admin.Slider-Baner.Sliders" , compact("sliders"));
    }


    public function create(){

        return view("Admin.Slider-Baner.AddSlider");
    }





    public function store(Request $request){
    

        //image
        if($request->hasFile('image')){

            $image = $request->file('image');
            $imagename = time(). '.' . $image->extension();
            $path = public_path('AdminAssets/Slider-Images');
            $imgFile =  Image::make($image->getRealPath());
            $imgFile->resize(600 , 300 ,function($constraint){
                $constraint->aspectRatio();
            })->save($path. '/' . $imagename);
    
        }


        $inputs = $request->all();
        $inputs['image'] = $imagename;

        Slider::create($inputs);


        Alert::success('موفقیت', 'اسلایدر با موفقیت ثبت شد');

        return redirect()->route('Admin.Slider.Sliders');



       
    }


    public function Delete($id){
        $slider = Slider::find($id);

        //delet image
        $sliderPath = 'AdminAssets/Slider-Images/'.$slider->image;
        if(File::exists($sliderPath)){
            File::delete($sliderPath);
        }


        $slider->delete();


        Alert::success('موفقیت', 'اسلایدر با موفقیت حذف شد');

        return redirect()->route('Admin.Slider.Sliders');




    }



    public function Baners(){

        $baners = Baner::all();
        return view('Admin.Slider-Baner.Baners' , compact('baners'));

    }



    public function createBaners(Request $request){

        return view('Admin.Slider-Baner.AddBaner');

    }


    public function storeBaners(Request $request){

        $baners = $request->all();

          //image
          if($request->hasFile('image')){

            $image = $request->file('image');
            $imagename = time(). '.' . $image->extension();
            $path = public_path('AdminAssets/Baner-Images');
            $imgFile =  Image::make($image->getRealPath());
            $imgFile->resize(200 , 200 ,function($constraint){
                $constraint->aspectRatio();
            })->save($path. '/' . $imagename);
    
        }

        $baners['image'] = $imagename;

        Baner::create($baners);
        Alert::success('موفقیت', 'بنر با موفقیت ذخیره شد');

        return redirect()->route('Admin.Baner.Baners');


    }


    public function DeleteBaners($id){
        $baner = Baner::find($id);
        $banerPath = 'AdminAssets/Baner-Images/'.$baner->image;
        if(File::exists($banerPath)){
            File::delete($banerPath);
        }


        $baner->delete();


        Alert::success('موفقیت', 'بنر با موفقیت حذف شد');

        return redirect()->route('Admin.Baner.Baners');

    }


    public function TextBaners(){


        $textBaners = TextBaner::all();

        return view('Admin/Slider-Baner/TextBaners',compact('textBaners'));
    }



    public function createTextBaner(){


        return view('Admin/Slider-Baner/AddTextBaner');
    }


    public function storeTextBaner(Request $request){


        $inputs = $request->all();
        TextBaner::create( $inputs );



        Alert::success('موفقیت', 'بنر با موفقیت ساخته شد');

        return redirect()->route('Admin.TextBaner.TextBaners');

        
    }


    public function DeleteTextBaner($id){

        $textBaner = TextBaner::find($id);
        $textBaner->delete();
        Alert::success('موفقیت', 'بنر با موفقیت حذف شد');
        return redirect()->route('Admin.TextBaner.TextBaners');

    }




}
