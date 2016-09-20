<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('files', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name',100);
            $table->string('url')->unique();
            $table->bigInteger('size');
        });
    }
    public function down()
    {
         Schema::drop('files');
            
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */

}
