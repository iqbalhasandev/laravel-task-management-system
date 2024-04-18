<form
    action="{{ isset($item) ? route(config('theme.rprefix') . '.update', $item->id) : route(config('theme.rprefix') . '.store') }}"
    method="POST" class="needs-validation modal-content" novalidate="novalidate" enctype="multipart/form-data"
    onsubmit="submitFormAxios(event)">
    @csrf
    @if (isset($item))
        @method('PUT')
    @endif
    <div class="card-header my-3 p-2 border-bottom">
        <h4>{{ config('theme.title') }}</h4>
    </div>
    <div class="modal-body">
        <table class="table table-hover table-striped">
            <tr>
                <th>
                    <label for="title" class="">
                        @localize('Tile')
                        <span class="text-danger">*</span>
                    </label>
                </th>
                <td>
                    <input type="text" class="form-control" name="title" id="title"
                        value="{{ isset($item) ? $item->title : old('title') }}" placeholder="@localize('title')"
                        required>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="description" class="">
                        @localize('description')
                        <span class="text-danger">*</span>

                    </label>
                </th>
                <td>
                    <textarea name="description" id="description" class="form-control" placeholder="@localize('description')" required>{{ isset($item) ? $item->description : old('description') }}</textarea>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="is_completed" class="">
                        @localize('Status')
                        <span class="text-danger">*</span>
                    </label>
                </th>
                <td>
                    <select name="is_completed" id="is_completed" class="form-control">
                        <option value="0" @if (isset($item) && $item->is_completed == 0) selected @endif>
                            @localize('pending')
                        </option>
                        <option value="1" @if (isset($item) && $item->is_completed == 1) selected @endif>
                            @localize('Completed')
                        </option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">@localize('Close')</button>
        <button class="btn btn-primary" type="submit">@localize('Save')</button>
    </div>
</form>
