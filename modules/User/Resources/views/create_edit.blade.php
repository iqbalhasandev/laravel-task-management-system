<x-app-layout>
    <x-card>
        <x-slot name='actions'>
            <a href="{{ route(config('theme.rprefix') . '.index') }}" class="btn btn-success btn-sm"><i
                    class="fa fa-list"></i>&nbsp;{{ localize('User List') }}</a>
        </x-slot>
        <div class="row">
            <div class="col-sm-12">
                <form enctype="multipart/form-data"
                    action="{{ isset($item) ? route(config('theme.rprefix') . '.update', $item->id) : route(config('theme.rprefix') . '.store') }}"
                    method="POST" class="needs-validation" enctype="multipart/form-data">
                    @csrf
                    @isset($item)
                        @method('PUT')
                    @endisset
                    <fieldset class="mb-5 py-3 px-4 ">
                        <legend>{{ localize('Personal Info') }}:</legend>
                        <div class=" row">
                            <div class="col-md-6">
                                <div class="form-group pt-1 pb-1">
                                    <label for="name" class="font-black">{{ localize('Name') }}</label>
                                    <input type="text" class="form-control" name="name" id="name"
                                        placeholder="{{ localize('Enter Name') }}"
                                        value="{{ isset($item) ? $item->name : old('name') }}" required>
                                    @error('name')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group pt-1 pb-1">
                                    <label for="email" class="font-black">{{ localize('Email') }}</label>
                                    <input type="email" class="form-control" name="email" id="email"
                                        placeholder="{{ localize('Enter Email') }}"
                                        value="{{ isset($item) ? $item->email : old('email') }}" required>
                                    @error('email')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group pt-1 pb-1">
                                    <label for="phone" class="font-black">{{ localize('Phone') }}</label>
                                    <input type="number" class="form-control arrow-hidden" name="phone"
                                        id="phone" placeholder="{{ localize('Enter phone') }}"
                                        value="{{ isset($item) ? $item->phone : old('phone') }}">
                                    @error('phone')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group pt-1 pb-1">
                                    <label for="gender" class="font-black">{{ localize('Gender') }}</label>
                                    <select class="form-control show-tick" name="gender" id="gender">
                                        <option selected disabled>--{{ localize('Select Gender') }}--</option>
                                        @foreach (App\Models\User::genderList() as $gender)
                                            <option {{ isset($item) ? selected($item->gender, $gender) : null }}>
                                                {{ $gender }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('gender')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group pt-1 pb-1">
                                    <label for="age" class="font-black">{{ localize('Age') }}</label>
                                    <input type="number" class="form-control arrow-hidden" name="age"
                                        id="age" placeholder="{{ localize('Enter your age') }}"
                                        value="{{ isset($item) ? $item->age : old('age') }}">
                                    @error('age')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6 py-1">
                                <div class="form-group pt-1 pb-1">
                                    <label for="address" class="font-black">{{ localize('Address') }}</label>
                                    <textarea name="address" id="address" class="form-control" placeholder="{{ localize('Enter your address') }}">{{ isset($item) ? $item->address : old('address') }}</textarea>
                                    @error('address')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="mb-5 py-3 px-4 ">
                        <legend>{{ localize('Account Info') }}:</legend>
                        <div class="row">
                            <div class="col-md-6 pt-1 pb-1">
                                <div class="form-group">
                                    <label for="role" class="font-black">{{ localize('User Role') }}</label>
                                    <select class="form-control show-tick" name="role" id="role" required>
                                        <option selected disabled>--{{ localize('Select User Role') }}--</option>
                                        @foreach (Modules\Role\Entities\Role::all() as $role)
                                            <option
                                                @isset($item) @selected($item->roles()->pluck('id')->first() == $role->id)
                                            @endisset
                                                value="{{ $role->id }}">
                                                {{ $role->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('role')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6 pt-1 pb-1">
                                <div class="form-group">
                                    <label for="status" class="font-black">Account Status</label>
                                    <select class="form-control show-tick" name="status" id="status" required>
                                        <option selected disabled>--{{ localize('Select Account Status') }}--</option>
                                        @foreach (App\Models\User::statusList() as $status)
                                            <option {{ isset($item) ? selected($item->status, $status) : null }}>
                                                {{ $status }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('user_status_id')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6 pt-1 pb-1">
                                <div class="form-group">
                                    <label for="password" class="font-black">{{ localize('Password') }}</label>
                                    <input type="password" class="form-control" name="password" id="password"
                                        placeholder="{{ localize('Enter Password') }}"
                                        {{ isset($item) ? '' : 'required' }} autocomplete="new-password">
                                    @error('password')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6 pt-1 pb-1">
                                <div class="form-group">
                                    <label for="password_confirmation"
                                        class="font-black">{{ localize('Confirm Password') }}</label>
                                    <input type="password" class="form-control" name="password_confirmation"
                                        id="password_confirmation" placeholder="{{ localize('Retype Password') }}"
                                        {{ isset($item) ? '' : 'required' }} autocomplete="new-password">
                                    @error('password_confirmation')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6 pt-1 pb-1">
                                <div class="form-group">
                                    <label for="avatar" class="font-black">{{ localize('Avatar') }}</label>
                                    <input type="file" class="form-control" name="avatar" id="avatar"
                                        onchange="get_img_url(this, '#avatar_image');"
                                        placeholder="{{ localize('Select avatar image') }}">
                                    <img id="avatar_image" src="{{ isset($item) ? $item->profile_photo_url : '' }}"
                                        width="120px" class="mt-1">
                                    @error('avatar')
                                        <p class="text-danger pt-2">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 ">
                                <div class="form-group pt-1 pb-1">
                                    <button type="submit"
                                        class="btn btn-success btn-round">{{ localize('Save') }}</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </x-card>
    @push('css')
        <link href="{{ module_asset('User/css/user.css') }}" rel="stylesheet">
    @endpush
</x-app-layout>
