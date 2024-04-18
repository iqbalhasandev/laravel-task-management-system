<x-app-layout>
    <div>



    </div>
    @push('css')
        <link rel="stylesheet" href="{{ admin_asset('css/dashboard.min.css') }}">
    @endpush

    @push('js')
        @can('chat_report')
            <script src="{{ admin_asset('vendor/amcharts5/index.js') }}"></script>
            <script src="{{ admin_asset('vendor/amcharts5/percent.js') }}"></script>
            <script src="{{ admin_asset('vendor/amcharts5/themes/Animated.js') }}"></script>
            <script src="{{ admin_asset('vendor/amcharts5/xy.js') }}"></script>
            <script src="{{ admin_asset('js/dashboard.js') }}"></script>
        @endcan

    @endpush
</x-app-layout>
