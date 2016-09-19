@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                @forelse ($files as $file)
                    <li><span class="file"><a href="uploads/{{$file->url}}">{{ $file->name }}</a></span> <span class="size">size : {{$file->size}} octet</span> <span class="download"><a href="uploads/{{$file->url}}" download="{{$file->name}}">Download</a></span></li>
                @empty
                    <p>No files on your server</p>
                @endforelse
                  
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
