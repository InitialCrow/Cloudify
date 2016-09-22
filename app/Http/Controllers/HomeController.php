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
    public function index(Request $request)
    {
        
        $session = $request->session();
        $session->put('folder_open', false);
        $session->put('folder_id', null);
        $session->put('prevPath', null);


        $files = $this->getFiles();
        $folders = $this->getFolders();
    
        return view('home',['files'=>$files, 'folders'=>$folders,'opened'=>$session->get('folder_open')]);
    }
    public function getFileInFolder(Request $request, $folder)
    {
      $session = $request->session();
      $session->put('folder_open', true);
      $folders = Db::table('folders')->select('*')->where('name', '=',$folder)->get();
      $session->put('folder_id', $folders[0]->id );
      $currentFolder = $session->get('prevPath');

      if($currentFolder === null){
        $session->put('prevPath', $folders[0]->name);
      } //if we are in root
      else{
        $currentFolder = $currentFolder.'/'.$folders[0]->name;
        $session->put('prevPath', $currentFolder);
      }
      
      $subFolders = Db::table('folders')->select('*')->where('folder_id','=',$folders[0]->id)->get();
     

      $files = Db::table('files')->select('*')->where('folder_id', '=',$folders[0]->id)->get();
      
      
      return view('home',['files'=>$files, 'folders'=>$folders, 'subFolders'=>$subFolders,'opened'=>$session->get('folder_open')]);
    
      
    }
    public function getFiles()
    {

        $files = DB::table('files')->select('*')->where('folder_id','=',null)->get();

        
        return $files;

    }
    public function getFolders(){
        $folders = DB::table('folders')->select('*')->where('folder_id','=',null)->get();
        return $folders;
    }
    public function upload(Request $request)
    {

        $files = $request->file('upload_file');
        $session = $request->session();
        $folderId = $session->get('folder_id');
        $opened = $session->get('folder_open');

        if($folderId == null && $opened === false){// we are in root

            foreach ($files as $file) {
                $name  =  $file->getClientOriginalName();
                $size = $file->getClientSize();
                $url = str_random(40).'.'.$file->getClientOriginalExtension();
              
                Db::table('files')->insert([
                    "name" => $name,
                    "url" => $url,
                    "size" => $size,
                    
                ]);
                
                $file->move(public_path().'/uploads/',$url);
            }
        }
        else{
         
            $folder = Db::table('folders')->select('name')->where('id','=',$folderId)->get();
            $prevPath = $session->get('prevPath').'/';

            foreach ($files as $file) {
                $name  =  $file->getClientOriginalName();
                $size = $file->getClientSize();
                $url = str_random(40).'.'.$file->getClientOriginalExtension();
            
                Db::table('files')->insert([
                    "name" => $name,
                    "url" => $prevPath.$url,
                    "size" => $size,
                    "folder_id"=> $folderId
                ]);
                
                $file->move(public_path().'/uploads/'.$prevPath,$url);
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
        $folderName = $request->input('addFolder');
        $session = $request->session();
        $prevPath = $session->get('prevPath');
        $opened = $session->get('foler_open');
        $folder_id = $session->get('folder_id');
        
        if($opened === false && $folder_id !== null) // if we are in root
        {
            
                Db::table('folders')->insert([
                'name'=>$folderName,
                'folder_id' =>$folder_id
            ]);
            File::makeDirectory(public_path()."/uploads/".$folderName,0775,true);
        }
        else{// if we are in subfolder
            
            Db::table('folders')->insert([
                'name'=>$folderName,
                'folder_id' =>$folder_id
            ]);
            File::makeDirectory(public_path()."/uploads/".$prevPath.'/'.$folderName,0775,true);
        }

        
        return redirect('/home');
    }
}
