<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="./vue/modal/modal.css">
</head>

<div class="section">
    <div class="container">
        <div class="justify-content-center">
            <div class="text-center align-self-center">
                <div class="section text-center">
                    <h6 class="mb-0 pb-3"><span>Connexion</span><span>Inscription</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">

                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3 title-modal">Connexion</h4>
                                        <form action="./index.php?controle=connexion&action=login" method="post">
                                            <div class="form-group">
                                                <input id="emailLogin" name="emailLogin" autocomplete="username" type="email" class="form-style" placeholder="Email">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input id="passwordLogin" name="passwordLogin" type="password" autocomplete="current-password" class="form-style" placeholder="Password">
                                                <i onclick="showPassword()" class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <button type="submit" class="btn mt-4">Se connecter</button>
                                        </form>
                                        <p class="mb-0 mt-4 text-center"><a  class="link_modal">Vous avez oublié votre mot de passe ?</a></p>

                                    </div>
                                </div>
                            </div>
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-3 pb-3 title-modal">Inscription</h4>
                                        <form action="./index.php?controle=inscription&action=inscription" method="post">
                                        <div class="form-group">
                                            <input id="nameRegister" name="nameRegister" type="text" class="form-style" placeholder="Full Name">
                                            <i class="input-icon uil uil-user"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input id="phoneRegister" name="phoneRegister" type="tel" class="form-style" placeholder="Phone Number">
                                            <i class="input-icon uil uil-phone"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input id="emailRegister" name="emailRegister" autocomplete="username" type="email" class="form-style" placeholder="Email">
                                            <i class="input-icon uil uil-at"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input id="passwordRegister" name="passwordRegister"  autocomplete="current-password" type="password" class="form-style" placeholder="Password">
                                            <i onclick="showPassword()" class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                            <button type="submit" class="btn mt-4">S'inscrire</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="./vue/modal/modal.js"></script>