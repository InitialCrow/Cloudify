@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
        <form action="/delete" method="post" enctype="multipart/form-data" class="uploaded-form">
            <div class="panel panel-default">
                
                <div class="panel-heading">My Files <button class="btn btn-default add-folder">+</button></div>



                <div class="panel-body">
                @forelse ($folders as $folder)
                    <li ><a data-name-folder="{{$folder->name}}" data-id-folder="{{$folder->id}}" href="uploads/{{$folder->name}}" class="folder"><img class="folder" src="css/img/folder.png" alt="logo d'un fichier" width="15px" height="15px">{{$folder->name}}</a></li>
                @empty
                @endforelse
                
                @forelse ($files as $file)
                    <li><input type="checkbox" class="check" name="check" data-url='{{$file->url}}' data-id='{{$file->id}}'><span class="file"><a href="uploads/{{$file->url}}">{{ $file->name }}</a></span> <span class="size">size : {{$file->size}} octet</span> <span class="download"><a href="uploads/{{$file->url}}" download="{{$file->name}}">Download</a></span></li>
                @empty
                    <p>No files on your server</p>
                @endforelse
                    
                 
                </div>
            </div>
            <button type="submit" class="btn btn-danger delete">Delete</button>
             {{ csrf_field() }}
        </form>
        </div>
    </div>
</div>
@endsection
