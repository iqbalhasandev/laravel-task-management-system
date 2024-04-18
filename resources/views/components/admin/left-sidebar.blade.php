    <nav class="sidebar sidebar-bunker sidebar-sticky">
        <div class="sidebar-header">
            <a href="{{ route('home') }}" class="sidebar-brand">
                <img class="sidebar-logo-lg"
                    src="{{ setting('site.logo_light', admin_asset('img/logo-light.png'), true) }}">
                <img class="sidebar-logo-sm" src="{{ setting('site.favicon', admin_asset('img/favicon.png'), true) }}">
            </a>
        </div>

        <!--/.sidebar header-->
        <div class="profile-element d-block align-items-center flex-shrink-0">
            <div class="avatar online mb-2">
                <img src="{{ auth()->user()->profile_photo_url }}" class="img-fluid rounded-circle">
            </div>
            <div class="profile-text text-center">
                <h6 class="m-0">{{ auth()->user()->name }}</h6>
                <span class="text-muted">
                    <i class="typcn typcn-media-record text-success"></i>
                    {{ implode(',', auth()->user()->getRoleNames()->toArray()) }}
                </span>
            </div>
        </div>

        <!--/.sidebar header-->
        <div class="sidebar-body">
            <nav class="sidebar-nav">
                <ul class="metismenu">
                    <x-admin.nav-link href="{{ route('admin.dashboard') }}">
                        <i class="typcn typcn-home-outline"></i>
                        {{ localize('Dashboard') }}
                    </x-admin.nav-link>

                    <!-- User Interface -->
                    @if (module_active('user') && can('user_management'))
                        <x-admin.multi-nav>
                            <x-slot name="title">
                                <i class="typcn typcn-group"></i> {{ localize('User Interface') }}
                            </x-slot>
                            <x-admin.nav-link href="{{ route('admin.user.index') }}">
                                {{ localize('User') }}
                            </x-admin.nav-link>
                            <x-admin.nav-link href="{{ route('admin.user.create') }}">
                                {{ localize('Create User') }}
                            </x-admin.nav-link>
                        </x-admin.multi-nav>
                    @endif
                    <!-- Role-Permission Management -->
                    @if (can('permission_management') || can('role_management'))
                        <x-admin.multi-nav>
                            <x-slot name="title">
                                <i class="typcn typcn-lock-closed-outline"></i> {{ localize('Role - Permission') }}
                            </x-slot>
                            @if (module_active('permission') && can('permission_management'))
                                <x-admin.nav-link href="{{ route('admin.permission.index') }}">
                                    {{ localize('Permission') }}
                                </x-admin.nav-link>
                            @endif

                            @if (module_active('role') && can('role_management'))
                                <x-admin.nav-link href="{{ route('admin.role.index') }}">
                                    {{ localize('Role') }}
                                </x-admin.nav-link>
                            @endif
                        </x-admin.multi-nav>
                    @endif
                    {{-- Backup Management --}}
                    @if (module_active('backup') && can('backup_management'))
                        <x-admin.nav-link href="{{ route('admin.backup.index') }}">
                            <i class="typcn typcn-cloud-storage-outline"></i>
                            {{ localize('Backup') }}
                        </x-admin.nav-link>
                    @endif
                    <!-- Setting Management -->
                    @if (module_active('setting') && can('setting_management'))
                        <x-admin.nav-link href="{{ route('admin.setting.index') }}">
                            <i class="typcn typcn-cog-outline"></i> {{ localize('Setting') }}
                        </x-admin.nav-link>
                    @endif
                </ul>
            </nav>
            <div class="mt-auto p-3 sidebar-logout">
                <x-logout>
                    <span class="btn btn-success w-100"> <img class="me-2"
                            src="{{ admin_asset('img/logout.png') }}"><span>{{ localize('Logout') }}</span></span>
                </x-logout>
            </div>
        </div>
        <!-- sidebar-body -->
    </nav>
