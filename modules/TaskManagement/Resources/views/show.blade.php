<div class="card-header my-3 p-2 border-bottom">
    <h4>{{ config('theme.title') }}</h4>
</div>
<div class="modal-body">
    <table class="table table-hover table-striped">
        <tr>
            <th>
                <label for="name" class="">
                    @localize('Name')
                </label>
            </th>
            <td>
                {{ $item->title ?? 'N/A' }}
            </td>
        </tr>
        <tr>
            <th>
                <label for="description" class="">
                    @localize('description')
                </label>
            </th>
            <td>
                {{ $item->description ?? 'N/A' }}
            </td>
        </tr>
        <tr>
            <th>
                <label for="is_completed" class="">
                    @localize('Status')
                </label>
            </th>
            <td>
                {!! $item->is_completed
                    ? '<span class="badge bg-success">' . localize('Active') . '</span>'
                    : '<span class="badge bg-danger">' . localize('Inactive') . '</span>' !!}
            </td>
        </tr>
    </table>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">@localize('Close')</button>
</div>
