<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use File;
use Storage;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $files = $this->getFiles();
        return view('home',['files'=>$files]);
    }
    public function getFiles()
    {
        $files = DB::table('files')->get();
        return $files;

    }
    public function upload(Request $request)
    {
        $files = $request->file('upload_file');
        foreach ($files as $file) {
            $name  =  $file->getClientOriginalName();
            $size = $file->getClientSize();
            $url = str_random(40).'.'.$file->getClientOriginalExtension();
           
            Db::table('files')->insert([
                "name" => $name,
                "url" => $url,
                "size" => $size,
            ]);
            $file->move('./uploads', $url);
        }
        return redirect('/home');
        
      
    }

}
