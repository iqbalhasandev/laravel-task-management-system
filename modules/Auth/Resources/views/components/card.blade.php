<div class="row h-100vh align-aitems-center">
    <div class="col-lg-12 d-flex align-aitems-center">
        <div class="form-wrapper p-0 m-auto">
            <div class="login-form-body">
                <div class="form-container my-4">
                    <div class="register-logo text-center mb-4">
                        <img class="img-fluid" src="{{ setting('site.logo_black', admin_asset('img/logo.png'), true) }}">
                    </div>
                </div>
                {{ $slot }}
            </div>
        </div>
    </div>
</div>
