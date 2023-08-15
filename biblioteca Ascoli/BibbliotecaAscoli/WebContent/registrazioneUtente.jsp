<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/b60ea6b0a3.js" crossorigin="anonymous"></script>
    <!--Custom css-->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/registrazione.css" rel="stylesheet">

    <script>
        function checkPassword() {
            var password = document.getElementById("pwd").value;
            var confirmPassword = document.getElementById("confirmPwd").value;

            if (password != confirmPassword) {
                alert("Le password non corrispondono. Riprova.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
    <section class="h-100 h-custom" style="background-color: #ffffff00;">
        <div class="container registrazione py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-8 col-xl-6">
                    <div class="card rounded-3">
                        
                          
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Info Registrazione</h3>


                            <form class="px-md-2" action="servlet" method="post" autocomplete="on"
                                onsubmit="return checkPassword()">
                                <input type="hidden" name="operazione" value="registrazioneUtente">

                                <!--Username-->
                                <div class="form-floating form-outline mb-4">
                                    <input type="text" class="form-control" id="username" placeholder="Nome Utente"
                                        name="username">
                                    <label for="username">Nome Utente</label>
                                </div>


                                <!--Email-->
                                <div class="form-floating mb-3 mt-3">
                                    <input type="email" class="form-control" id="email" placeholder="Enter email"
                                        name="email" required>
                                    <label for="email" style="color: black;">Email</label>
                                </div>
                                <!--Password-->
                                <div class="form-floating mt-3 mb-3">
                                    <input type="password" class="form-control" id="pwd"
                                        placeholder="Enter password" name="pass" required>
                                    <label for="pwd" style="color: black;">Password</label>
                                </div>
                                <!--Conferma Password-->
                                <div class="form-floating mt-3 mb-3">
                                    <input type="password" class="form-control" id="confirmPwd"
                                        placeholder="Enter password" name="pass" required>
                                    <label for="confirmPwd" style="color: black;">Conferma Password</label>
                                </div><br>


                                <br>


                                <button type="submit" class="btn btn-dark btn-lg mb-1"
                                    value="Completa registrazione">Registrati</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>
