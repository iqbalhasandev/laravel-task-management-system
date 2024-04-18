<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Modules\Language\Database\Seeders\LanguageTableSeeder;
use Modules\Setting\Database\Seeders\SettingSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            LanguageTableSeeder::class,
            RoleTableSeeder::class,
            SettingSeeder::class,
        ]);

        Artisan::call('optimize:clear');
    }
}
