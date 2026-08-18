<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (\Illuminate\Support\Facades\Schema::hasTable('settings')) {
            $settings = \Illuminate\Support\Facades\DB::table('settings')->pluck('value', 'key')->all();
            config(['app.name' => $settings['app_name'] ?? 'PRISMA-PW']);
            view()->share('sys_settings', $settings);
        } else {
            view()->share('sys_settings', [
                'app_name' => 'PRISMA-PW',
                'app_description' => 'Portal Informasi Sumber Daya Manusia Panti Waluya',
                'institution_name' => 'STIKes Panti Waluya Malang'
            ]);
        }
    }
}
