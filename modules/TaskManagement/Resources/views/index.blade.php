<x-app-layout>
    <x-card>
        <x-slot name='actions'>
            <a class="btn btn-success btn-sm" href="javascript:void(0);"
                onclick="axiosModal('{{ route(\config('theme.rprefix') . '.create') }}')">
                <i class="fa fa-plus"></i>&nbsp;
                {{ localize('Create') }}
            </a>
        </x-slot>
        <div>
            <x-data-table :dataTable="$dataTable" />
            <div id="page-axios-data" data-table-id="#task-table"></div>
        </div>
    </x-card>
    @push('lib-styles')
        <link rel="stylesheet" href="{{ admin_asset('vendor/daterangepicker/daterangepicker.min.css') }}">
    @endpush

</x-app-layout>
