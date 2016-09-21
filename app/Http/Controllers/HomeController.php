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
        $folders = $this->getFolders();
    
        return view('home',['files'=>$files, 'folders'=>$folders]);
    }
    public function getFileInFolder($folder)
    {

      $folders = Db::table('folders')->select('*')->where('name', '=',$folder)->get();
     

      $files = Db::table('files')->select('*')->where('folder_id', '=',$folders[0]->id)->get();
      
      
      return $files;
    
      
    }
    public function getFiles()
    {

        $files = DB::table('files')->select('*')->where('folder_id','=',null)->get();

        
        return $files;

    }
    public function getFolders(){
        $folders = DB::table('folders')->get();
        return $folders;
    }
    public function upload(Request $request)
    {
        $files = $request->file('upload_file');
        $folderId = $request->input('folder_id');

        if($folderId !== null){

            $folder = Db::table('folders')->select('name')->where('id','=',$folderId)->get();
            foreach ($files as $file) {
                $name  =  $file->getClientOriginalName();
                $size = $file->getClientSize();
                $url = str_random(40).'.'.$file->getClientOriginalExtension();
              
                Db::table('files')->insert([
                    "name" => $name,
                    "url" => $url,
                    "size" => $size,
                    "folder_id"=> $folderId
                ]);
                
                $file->move('./uploads/'.$folder[0]->name.'/', $url);
            }
        }
        else{

            foreach ($files as $file) {
                $name  =  $file->getClientOriginalName();
                $size = $file->getClientSize();
                $url = str_random(40).'.'.$file->getClientOriginalExtension();
              
                Db::table('files')->insert([
                    "name" => $name,
                    "url" => $url,
                    "size" => $size,
                    "folder_id"=> $folderId
                ]);
                
                $file->move('./uploads', $url);
            }

        
        
        }
        return redirect('/home');
        
      
    }
    public function deleteFile(Request $request)
    {
        $files = $request->input();
        $urls = $files['url'];
        $ids = $files['id'];
        $folderId = $request->input('folder_id');

        if($folderId !== null){
            $folder = Db::table('folders')->select('name')->where('id','=',$folderId)->get();
            for($i = 0; $i<count($ids); $i++){
                File::delete(public_path().'/uploads/'.$folder[0]->name.'/'.$urls[$i]);
            }
        }
        
        for($i = 0; $i<count($ids); $i++){
        
            Db::table('files')->where('id','=',$ids[$i])->delete();
            File::delete(public_path()."/uploads/".$urls[$i]);
        }
   
      
        
        return redirect('/home');
    
    }
    public function addFolder(Request $request)
    {
        $folder = $request->input('addFolder');
        Db::table('folders')->insert([
            'name'=>$folder
        ]);
        File::makeDirectory(public_path()."/uploads/".$folder,0775,true);
        return redirect('/home');
    }

}
